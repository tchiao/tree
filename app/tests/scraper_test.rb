def scrape_titles
  test_entries = TestEntry.all
  total = test_entries.length
  total_true, total_false = 0, 0

  for t in test_entries
    text = Nokogiri.parse(t.content)
    scraped_title = Scraper.get_title(text, t.url)
    if scraped_title.include?(t.actual_title)
      total_true += 1
    else
      total_false += 1
      p [scraped_title, t.actual_title]
    end
  end
  accuracy = ((total_true / total.to_f) * 100).round(3)
  p "You tested #{total} articles. #{total_true} were true, #{total_false} were false. The title scraper has a #{accuracy}% accuracy."
end

def scrape_location
  wiki_entries = TestEntry.where(article_type: "wiki_event").all
  total = wiki_entries.length
  total_true, total_false = 0, 0
  for t in wiki_entries
    text = Nokogiri.parse(t.content)
    scraped_location = Scraper.get_location(text, t.url)
    if scraped_location == t.actual_location
      total_true += 1
    else
      total_false += 1
      p [scraped_location, t.actual_location]
    end
  end
  accuracy = ((total_true / total.to_f) * 100).round(3)
  p "You tested #{total} articles. #{total_true} were true, #{total_false} were false. The location scraper has a #{accuracy}% accuracy."
end

def scrape_dates
  test_entries = TestEntry.all
  total = test_entries.length
  total_true, total_false = 0, 0
  for t in test_entries
    text = Nokogiri.parse(t.content)

    scraped_date = Scraper.get_date(text, t.url)
    scraped_array = []
    if scraped_date != nil
      scraped_date = Date.parse(scraped_date)
      scraped_array = [scraped_date.month, scraped_date.day, scraped_date.year]
    end
    if scraped_array == [t.actual_month, t.actual_day, t.actual_year]
      total_true += 1
    else
      total_false += 1
      p [scraped_array, [t.actual_month, t.actual_day, t.actual_year]]
    end
  end
  accuracy = ((total_true / total.to_f) * 100).round(3)
  p "You tested #{total} articles. #{total_true} were true, #{total_false} were false. The title scraper has a #{accuracy}% accuracy."
end

def scrape_categories
  test_entries = TestEntry.all
  total = test_entries.length
  for t in test_entries
    text = Nokogiri.parse(t.content)
    p Scraper.get_categories(text, t.url)
  end
  p "You tested #{total} articles."
end


def scrape_body
  test_entries = TestEntry.all
  total = test_entries.length
  for t in test_entries
    text = Nokogiri.parse(t.content)
    p "#{t.id}, #{t.url}, #{t.actual_title}"
    p Scraper.get_body(text)
  end
  p "You tested #{total} articles."
end 



