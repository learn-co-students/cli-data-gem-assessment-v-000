require_relative './photo.rb'
class Slideshower::Photos
attr_accessor :photos, :subject


def self.all

  puts "Displaying photos of #{@subject}"
  loop do Photo.each do |i|
    puts i
    sleep(5)
      end
end
end








end #of slideshower
