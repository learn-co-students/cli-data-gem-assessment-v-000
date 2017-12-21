
class Slideshower::Photos
attr_accessor :photos, :subject


def self.slideshow
  puts "Displaying Slideshow of #{Slideshower::Search.subject}photos."

  Photo::all.each do |i|
    puts i.name
    puts "http://www.pexels.com#{i.url}"
    puts
    sleep(3)
  end
end

def self.list
puts "Displaying List of #{Slideshower::Search.subject}photos."
   Photo::all.each do |i|
    puts i.name
    puts "http://www.pexels.com#{i.url}"
    puts
      end
end

end #of slideshower
