admin = User.new(
  name: 'Admin User',
  email: 'admin@tree.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

moderator = User.new(
  name: 'Moderator User',
  email: 'mod@tree.com',
  password: 'helloworld'
)
moderator.skip_confirmation!
moderator.save!

entry = Entry.create!(
  title: "First Public Operation with Anesthesia",
  date: "1846-10-16",
  location: "Boston, Massachusetts, US",
  body: "Anesthesia was discovered by William Morton, an American dentist, in 1846. Boston surgeon Henry Jacob Bigelow heard about his discovery in the newspapers and arranged for a demonstration at the operating theater of Massachusetts General Hospital, during which Dr. John Collins Warren painlessly removed a tumor from a patient. News of anesthesia spread rapidly after.",
  category_list: "health, medicine"
)

entry = Entry.create!(
  title: "Tiananmen Square protests",
  date: "1989-04-16",
  location: "Beijing, China",
  body: "The protests were student-led demonstrations triggered by the death of former Communist Party general secretary, Hu Yaobang, who was deposed after losing a power struggle over the direct of political and economic reform.",
  category_list: "China, politics"
)

entry = Entry.create!(
  title: "East and West Germany reunite",
  date: "1990-10-03",
  location: "Germany",
  body: "The gradual waning of Soviet power in the late 1980s in turn causes the Communist Party in East Germany to lose power. Tens of thousands of East Germans flee the nation, and by late 1989 the wall begins to come down. Talks between East and West Germany, aided by officials from the United States, Great Britain, and the USSR prompt the possibility of reunification. Many observers saw the reunification of Germany as marking the end of the Cold War.",
  category_list: "Germany, international"
)

entry = Entry.create!(
  title: "Java Language Released",
  date: "1995-05-23",
  location: "San Francisco, California, US",
  body: "On this day, John Gage, the director of the Science Office of Sun Microsystems, along with Marc Andreesen, co-founder and executive vice president of Netscape announced that Java was a reality and to be incorporated into Netscape Navigator.",
  category_list: "computer science"
)

entry = Entry.create!(
  title: "Ruby Language Released",
  date: "1995-12-21",
  location: "Japan",
  body: "The first public release of Ruby 0.95 was announced on Japanese domestic newsgroups, with three more versions of Ruby were released in two days. It was designed and developed in the mid-1990s by Yukihiro “Matz” Matsumoto and said to be influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp.",
  category_list: "computer science"
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Entry.count} entries created"
puts "#{Category.count} categories created"