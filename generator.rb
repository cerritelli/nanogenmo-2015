require 'open3'
require 'pp'

pp "Let's generator a very silly novel."

names =  %w(Alex John Jason Laura Catherine Shawn Olivia William Mark Joseph Anthony Caroline Robert Aimee)
novel = "And so it was that "
16667.times do 
  novel << names.sample
  novel << " begat "
end

novel << names.sample
novel << " and it was good."

time = Time.now.to_s
file_name = time + "_novel.txt"

output = File.open( file_name,"w" )
output << novel
output.close