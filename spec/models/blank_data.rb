data = [
url0 = "",
url1 = "",
url2 = "",
url3 = "",
url4 = "",
url5 = "",
url6 = "",
url7 = "",
url8 = "",
url9 = "",
url10 = "",
url11 = "",
url12 = "",
url13 = "",
url14 = "",
url15 = "",
url16 = "",
url17 = "",
url18 = "",
url19 = "",
url20 = "",
url21 = "",
url22 = "",
url23 = "",
url24 = "",
url25 = "",
url26 = "",
url27 = "",
url28 = "",
url29 = "",
url30 = "",
url31 = "",
url32 = "",
url33 = "",
url34 = "",
url35 = "",
url36 = "",
url37 = "",
url38 = "",
url39 = "",
url40 = "",
url41 = "",
url42 = "",
url43 = "",
url44 = "",
url45 = "",
url46 = "",
url47 = "",
url48 = "",
url49 = "",
url50 = "",
url51 = "",
url52 = "",
url53 = "",
url54 = "",
url55 = "",
url56 = "",
url57 = "",
url58 = "",
url59 = "",
url60 = "",
url61 = "",
url62 = "",
url63 = "",
url64 = "",
url65 = "",
url66 = "",
url67 = "",
url68 = "",
url69 = "",
url70 = "",
url71 = "",
url72 = "",
url73 = "",
url74 = "",
url75 = "",
url76 = "",
url77 = "",
url78 = "",
url79 = "",
]



results_hash = Hash.new(0)
for url in data
  if results_hash[url] == 0
    scraper = Scraper.new(url)
    results = scraper.scrape
    results_hash[url] = results
  end
end

testing_array = [[url, title, date, body, location],
for entry in testing_data_array
  url = testing_array[0]
  results_hash[url][title] == testing_array[1]
end

rspec spec/models/scraper_spec.rb 
url, title, date, body, categories, location

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
