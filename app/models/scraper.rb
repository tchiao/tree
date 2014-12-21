require 'benchmark'

class Scraper

  COMMON_WORDS = %w(a an and are as at be been best but by can do first for from had has have he her him his how in into involving if is it its more most my nav not of on one only or our return said see she stories such that the they their this to top var was we were what which who with would you your)

  def initialize(url)
    @url = url
    #begin
    @doc = Nokogiri.parse(HTTParty.get(@url).parsed_response)
    #rescue URI::InvalidURIError => e
      #return @doc = "Invalid URI"
      #@errors
    #rescue
    #  return 
    #end
  end

  def scrape
    # For Wikipedia articles
    if @url.include?("wikipedia")
      @title = @doc.title.sub(" - Wikipedia, the free encyclopedia", "")
      @doc.css('.reflist, .refbegin, #mw-panel, #footer').remove
      if @doc.at('h2:contains("See also")')
        @doc.at('h2:contains("See also")').next_element.remove
      end
      
      if wiki_box?
        wiki_location
        wiki_date
      end
    else
      @title = @doc.css('title').text.strip rescue nil
      get_date
    end
    
    @body = get_body
    @category_list = get_categories
    @results = { title: @title , month: @month, day: @day, year: @year, location: @location, body: @body, category_list: @category_list}

  end

  private

  def wiki_box?
    @doc.at('table.infobox.vevent')
  end

  def wiki_location
    @location = @doc.css(".location").text.gsub("\n", ",")
    if @location == nil
      @location = @doc.at('th:contains("Areas affected")').next_element.text.gsub("\n", ", ")
    end
    if @location.split(",").size > 4
      @location = @location.split(",")[0..3].join(",")
    end
  end

  def wiki_date
    date_text = @doc.at('th:contains("Date")').next_element.text
    @date = Date.parse(date_text)
    @month = @date.month
    @day = @date.day
    @year = @date.year
  end

  def get_date
    text = @doc.css('p').text
    day_month_year = /(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov|Dec(?:ember)?) (?:\d{1,2}), (?:\d{4})/
    month_day_year = /(?:\d{1,2}) (?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov|Dec(?:ember)?) (?:\d{4})/
    @date = text.scan(month_day_year).first
    if @date == nil
      @date = text.scan(day_month_year).first
    end
    unless @date == nil
      @date = Date.parse(@date)
      @month = @date.month
      @day = @date.day
      @year = @date.year
    end
  end

  def get_body
    for p in @doc.css('p')
      if p.text.size > 250 && !(p.text.include?("\n"))
        @body = p.text.gsub("\"", "'").gsub(/\[(.*?)\]/, "").strip
        return @body
      end
    end
  end

  # Categories  
  def get_categories
    document = @doc.text.gsub("\n", " ").gsub("\"", "").gsub(".", "").split
    text_hash = Hash.new(0)
    for word in document
      text_hash[word] += 1
    end
    proper_array = two_proper_nouns
    
    text_hash.delete_if { |key, value| remove_common_words(key) || is_i?(key) || is_sym?(key) || key.length < 2 || proper_array[0].include?(key) || proper_array[1].include?(key) }
    return top_four_categories(proper_array, text_hash)
  end

  def remove_common_words(word)
    return true if COMMON_WORDS.any? {|i| i.casecmp(word) == 0 }
  end

  def is_i?(num)
    Float(num) != nil rescue false
  end

  def is_sym?(word)
    return true if word =~ /[^\w\s]/
  end

  def top_four_categories(array, hash)
    keys_array = Hash[hash.sort_by { |k, v| -v }].keys
    category_array = array
    for word in keys_array
      if category_array.length < 4
        category_array << word unless category_array.any? {|i| i.casecmp(word) == 0 } 
      end
    end
    return category_array
  end

  def two_proper_nouns
    text = @doc.text.gsub("\"", "'").gsub(/\[\w+\]/, "").gsub(/\s+/, " ").gsub("\t", " ").strip
    proper_nouns = text.scan(/([A-Z][\w-]*(\s+[A-Z][\w-]*){1,2})/).map{|i| i.first}
    text_hash = Hash.new(0)
    for word in proper_nouns
      text_hash[word] += 1
    end
    text_hash.delete_if { |key, value| key.include?("Image") || key.include?("Audio")}

    Hash[text_hash.sort_by { |k, v| -v }].keys[0..1]
  end

end