class ScrapersController < ApplicationController
  COMMON_WORDS = %w(a an and are as at be been best but by can do first for from had has have he her him his how in into involving if is it its more most my nav not of on one only or our return said see she stories such that the they their this to top var was we were what which who with would you your)

  def create
    @entry_url = params[:url]
    @doc = Nokogiri.parse(HTTParty.get(@entry_url).parsed_response)
    binding.pry
    # For Wikipedia articles
    if @entry_url.include?("wikipedia")
      @title = @doc.title.sub(" - Wikipedia, the free encyclopedia", "")
      if wiki_box?
        @location = @doc.css(".location").text.gsub("\n", ",")
        wiki_date
      end
    else
      @title = @doc.css('title').text.strip rescue nil
    end
    
    @body = get_body
    @category_list = get_categories(@doc)
    @results = { title: @title , month: @month, day: @day, year: @year, location: @location, body: @body, category_list: @category_list}

    # render "create.html.erb", layout: false
    render json: @results
  end

  private

  def wiki_box?
    @doc.at('table.infobox.vevent')
  end

  def wiki_date
    date_text = @doc.at('th:contains("Date")').next_element.text
    @date = Date.parse(date_text)
    @month = @date.month
    @day = @date.day
    @year = @date.year
  end

  def get_body
    for p in @doc.css('p')
      if p.text.size > 250
        @body = p.text.gsub("\"", "'").gsub(/\[\w+\]/, "").strip
        return @body
      end
    end
  end

  # Categories  
  def get_categories(doc)
    document = doc.text.gsub("\n", " ").gsub("\"", "").gsub(".", "").split
    text_hash = Hash.new(0)
    for word in document
      text_hash[word] += 1
    end
    text_hash.delete_if { |key, value| value < 3 || remove_common_words(key) || is_i?(key) || is_sym?(key) || key.length < 2 }
    
    return top_four_categories(text_hash)
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

  def top_four_categories(hash)
    keys_array = Hash[hash.sort_by { |k, v| -v }].keys
    category_array = []
    for word in keys_array
      if category_array.length < 4
        category_array << word unless category_array.any? {|i| i.casecmp(word) == 0 }
      end
    end
    return category_array
  end


end
