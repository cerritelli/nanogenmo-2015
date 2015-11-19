require 'open3'
require 'pp'
require "set"

pp "Let's generator a very silly novel."
puts "\n\n"

names =  %w(Alex John Jason Laura Catherine Shawn Olivia William Mark Joseph Anthony Caroline Robert Aimee)
novel = "And so it was that "
16667.times do 
  novel << names.sample
  novel << " begat "
end

novel << names.sample
novel << " and it was good."

time = Time.now.to_s.gsub(" ", "_")
file_name = time + "_novel.txt"

output = File.open( file_name,"w" )
output << novel
output.close


file = File.open("/Users/echidnapi/Documents/nanogenmo-2015/creation\ myths/long\ stories/genesis.txt", "r")
bible = file.read
bible_words = bible.split

dict = {}

(bible_words.count - 3).times do |i|
  prefix = bible_words[i..(i + 1)]
  suffix = [bible_words[i + 2], bible_words[i + 3]]
  dict[prefix] ||= Set.new
  dict[prefix] << suffix
end

prefix = ["In", "the"]
text = prefix.join " "

50.times do 
  suffix_set = dict[prefix]
  suffix = suffix_set.to_a.sample
  text << " "
  text << suffix.to_a.join(" ")
  prefix = suffix
end
pp text

puts "\n\n"
creation_dict = {}
Dir.glob('/Users/echidnapi/Documents/nanogenmo-2015/creation\ myths/short\ stories/*.txt') do |rb_file|
  file = File.open(rb_file, "r")
  story = file.read
  story_words = story.split

  (story_words.count - 3).times do |i|
    prefix = story_words[i..(i + 1)]
    suffix = [story_words[i + 2], story_words[i + 3]]
    creation_dict[prefix] ||= Set.new
    creation_dict[prefix] << suffix
  end
end

prefix = ["In", "the"]
text = prefix.join " "

50.times do 
  suffix_set = creation_dict[prefix]
  suffix = suffix_set.to_a.sample
  text << " "
  text << suffix.to_a.join(" ")
  prefix = suffix
end
pp text

puts "\n\n"


(bible_words.count - 3).times do |i|
  prefix = bible_words[i..(i + 1)]
  suffix = [bible_words[i + 2], bible_words[i + 3]]
  creation_dict[prefix] ||= Set.new
  creation_dict[prefix] << suffix
end
prefix = ["In", "the"]
text = prefix.join " "

50.times do 
  suffix_set = creation_dict[prefix]
  suffix = suffix_set.to_a.sample
  text << " "
  text << suffix.to_a.join(" ")
  prefix = suffix
end
pp text



# clean up text
# content = File.readlines "/Users/echidnapi/Documents/nanogenmo-2015/sources/bible.txt"
# content.each {|line| line.gsub! /\d+:\d+/i,""}
# File.open('output.txt', 'w') { |f| content.each { |line| f << line } }

