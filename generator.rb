require 'open3'
require 'pp'
require "set"

pp "Let's generator a very silly novel."

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


file = File.open("/Users/echidnapi/Documents/nanogenmo-2015/sources/fixedbible.txt", "r")
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

20.times do 
  suffix_set = dict[prefix]
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

