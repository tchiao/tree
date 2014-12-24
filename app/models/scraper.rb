require 'benchmark'

class Scraper

  COMMON_WORDS = %w(a about after ago all an and are as at back be because been before best but by can could day days did do down first for from get had has have he her him his hours how in into involving if is it its just like link me month months more most my nav new no not of on one only or our out pageAds people return said says see she so stories such that the they their them then this to told top typeof up upon var was we weeks went were what when where which who will with would you your) 

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
    @title = self.class.get_title(@doc, @url)
    @date = self.class.get_date(@doc, @url)
    unless @date == nil
      @date = Date.parse(@date)
      @month = @date.month
      @day = @date.day
      @year = @date.year
    end
    @location = self.class.get_location(@doc, @url)
    @body = self.class.get_body(@doc)
    @category_list = self.class.get_categories(@doc, @url)

    @results = { title: @title , month: @month, day: @day, year: @year, location: @location, body: @body, category_list: @category_list}
  end

  class << self

    def wiki_url?(url)
      url.include?("wikipedia")
    end

    def wiki_box?(doc)
      doc.at('table.infobox.vevent')
    end

    def get_title(doc,url)
      if wiki_url?(url)
        @title = doc.title.sub(" - Wikipedia, the free encyclopedia", "")
      else
        @title = 
        @title = doc.css('title').text.strip.gsub("’", "'").gsub("“", "'") rescue nil
      end
    end

    def get_date(doc,url)
      if wiki_box?(doc)
        @date = doc.at('th:contains("Date")').next_element.text
      else
        text = doc.css('p').text
        day_month_year = /(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov|Dec(?:ember)?) (?:\d{1,2}), (?:\d{4})/
        month_day_year = /(?:\d{1,2}) (?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov|Dec(?:ember)?) (?:\d{4})/
        @date = text.scan(month_day_year).first
        if @date == nil
          @date = text.scan(day_month_year).first
        end
      end
    end

    def get_location(doc, url)
      if wiki_box?(doc)
        location = doc.css(".location").text.gsub("\n", ",")
        if location == "" && doc.at('th:contains("Areas affected")') != nil
          location = doc.at('th:contains("Areas affected")').next_element.text.gsub("\n", ", ")
        end
        unless location == ""
          if location.split(",").size > 4
            location = location.split(",")[0..3].join(",")
          end
        end
        location.gsub(";", "").gsub(", (", " (")
      end
    end

    def get_body(doc)
      for p in doc.css('p')
        if p.text.size > 250
          if !(p.text.strip.include?("\n"))
            body = p.text.gsub("\"", "'").gsub(/\[(.*?)\]/, "").gsub("  ", " ").strip
            return body
          else
            body = p.text.gsub("\"", "'").gsub(/\[(.*?)\]/, "").gsub("\n", " ").gsub("  ", " ").strip
          end
        end
      end
      return body
    end

    def get_categories(doc,url)
      if wiki_url?(url)
        doc.css('.reflist, .refbegin, #mw-panel, #footer').remove
        if doc.at('h2:contains("See also")')
          doc.at('h2:contains("See also")').next_element.remove
        end
      end

      final_array = get_proper_categories(doc).keys[0..1]
      common_words = get_common_categories(doc).delete_if {|k,v| final_array[0].include?(k) || final_array[1].include?(k) }.keys

      for word in common_words
        if final_array.length < 4
          final_array << word unless final_array.any? {|i| i.casecmp(word) == 0 } 
        end
      end
      return final_array
    end

    def get_common_categories(doc)
      document = doc.text.gsub("\n", " ").gsub("\"", "").gsub(".", "").split
      text_hash = Hash.new(0)
      for word in document
        text_hash[word] += 1
      end    
      text_hash.delete_if { |k,v| remove_common_words(k) || is_i?(k) || is_sym?(k) || k.length < 2 }
      return Hash[text_hash.sort_by {|k,v| -v}]
    end

    def get_proper_categories(doc)
      text = doc.text.gsub("\"", "'").gsub(/\[\w+\]/, "").gsub(/\s+/, " ").gsub("\t", " ").strip
      proper_nouns = text.scan(/([A-Z][\w-]*(\s+[A-Z][\w-]*){1,2})/).map{|i| i.first}
      text_hash = Hash.new(0)
      for word in proper_nouns
        text_hash[word] += 1
      end
      text_hash.delete_if { |k, v| k.include?("Image") || k.include?("Audio")}
      return Hash[text_hash.sort_by { |k, v| -v }]
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
  end
end