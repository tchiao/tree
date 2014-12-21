require "rails_helper"

describe Scraper do

  describe "categories scraper" do
    
  context "Wikipedia Based Tests" do 
    it "should at least exist" do
      #setup
        url = "http://en.wikipedia.org/wiki/World_War_II"

      #exercise
        scraper = Scraper.new(url)
        results = scraper.scrape
      #validate
        expect(results[:category_list]).to eq ["Soviet Union", "World War II", "German", "war"]
    end
  end
end


  

# setup
url = "http://en.wikipedia.org/wiki/World_War_II"

#exercise
scraper = Scraper.new(url)
results = scraper.scrape

#validate
expect(results[:title]).to eq "World War II"
