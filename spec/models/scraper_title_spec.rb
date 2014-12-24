require "rails_helper"

describe Scraper do

  describe "title scraper" do

    it "finds the title" do
      test_entries = TestEntry.all
      for t in test_entries
        total = test_entries.length
        total_true, total_false = 0, 0
        text = Nokogiri.parse(t.content)
        scraped_title = Scraper.get_title(text, t.url)
        if scraped_title.include? t.actual_title
          total_true += 1
        else
          p [scraped_title, t.actual_title]
          total_false += 1
        end
      end
      accuracy = ((total_true / total.to_f) * 100).round(3)
      p "You tested #{total} articles. The title scraper has a #{accuracy}% accuracy."
    end
  end
end
