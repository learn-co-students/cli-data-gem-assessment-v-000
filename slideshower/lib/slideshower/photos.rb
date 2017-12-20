require_relative './photo.rb'
class Slideshower::Photos
attr_accessor :photos, :subject


def self.all

  puts "Displaying photos of #{Slideshower::Search.subject}"

  loop do Photo::all.each do |i|

    puts i.name
    puts "http://www.pexels.com#{i.url}"
    sleep(3)

      end
end
end








end #of slideshower
