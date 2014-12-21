require "rails_helper"

describe Scraper do

  describe "title scraper" do
    before do
      @ewiki_array = [["http://en.wikipedia.org/wiki/Sinking_of_the_RMS_Titanic", "Sinking of the RMS Titanic", 4, 15, 1912, "North Atlantic Ocean"],
      ["http://en.wikipedia.org/wiki/World_War_II","World War II", 9, 1, 1939, "Europe, Pacific, Atlantic, South-East Asia"],
      ["http://en.wikipedia.org/wiki/American_Revolutionary_War", "American Revolutionary War", 4, 19, 1775, "Eastern North America, Gibraltar, Balearic Islands, Central America"],
      ["http://en.wikipedia.org/wiki/Assassination_of_Abraham_Lincoln", "Assassination of Abraham Lincoln",  4,14, 1865, "Ford's Theatre, Washington, D.C."]
      ]

      @wiki_array = [
      ["http://en.wikipedia.org/wiki/I_Have_a_Dream", "I Have a Dream", 8, 28, 1963],
      ["http://en.wikipedia.org/wiki/United_States_Declaration_of_Independence", "United States Declaration of Independence", 7, 4, 1776]
      ]

      @history_array = [["http://www.acs.org/content/acs/en/education/whatischemistry/landmarks/flemingpenicillin.html", "Discovery and Development of Penicillin"],
      ["http://www.nasa.gov/mission_pages/apollo/apollo11.html#.VI44vmTF_xH", "July 20, 1969: One Giant Leap For Mankind"],
      ["http://www.pbs.org/newshour/rundown/the-real-story-behind-the-worlds-first-antibiotic/", "The Real Story Behind Penicillin"]
      ]

      @gen_array = [["http://www.nytimes.com/2014/12/21/magazine/what-happened-when-marissa-mayer-tried-to-be-steve-jobs.html?ref=magazine", "What Happened When Marissa Mayer Tried to Be Steve Jobs"],
      ["http://www.modernluxury.com/san-francisco/story/the-smartest-bro-the-room", "The Smartest Bro in the Room"]
      ]

      @all_articles = @ewiki_array + @wiki_array + @history_array + @gen_array
    end

    it "finds the title" do
      loop_articles(@all_articles, :title, 1)
    end

    it "finds the location" do
      loop_articles(@ewiki_array, :location, 5)
    end

    def loop_articles(array, type, position)
      total = array.length
      total_true, total_false = 0, 0
      p "Testing the article #{type}"
      for entry in array
        scraper = Scraper.new(entry[0])
        results = scraper.scrape
        if results[type] == entry[position]
          total_true += 1
        else
          total_false += 1
        end
      end
      accuracy = ((total_true / total.to_f) * 100).round(3)
      p "You tested #{total} articles. The #{type} scraper has a #{accuracy}% accuracy."
      #p [(results[type]), entry[position], results[type] == entry[position]]
    end

  end
end


#url, title, month day year,location