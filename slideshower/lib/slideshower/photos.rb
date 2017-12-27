
class Slideshower::Photos
attr_accessor :photos, :subject


def self.slideshow
x = 0
  puts
  puts "Displaying Slideshow of #{Slideshower::Search.subject}photos."
  puts

  Photo::all.each do |i|

if i.name == nil || i.name.value == ""
  puts "#{Slideshower::Search.subject.capitalize}#{x+=1}"
else
    puts i.name
end
    puts "http://www.pexels.com#{i.url}"
    puts
    sleep(3)
  end
end

def self.list
x = 0
puts
puts "Displaying List of #{Slideshower::Search.subject}photos."
puts

   Photo::all.each do |i|
     if i.name == nil || i.name.value == ""
       puts "#{Slideshower::Search.subject.capitalize}#{x+=1}"
     else
         puts i.name
     end

    puts "http://www.pexels.com#{i.url}"
    puts
      end
end

end #of slideshower
