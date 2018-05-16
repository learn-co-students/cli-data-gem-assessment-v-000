class Applist::Apps
  attr_accessor :name, :category
  
  def self.popular
    #app_page = Nokogiri::HTML(open("https://www.apple.com/itunes/charts/free-apps/"))
    apps = []
    #app_page.css("div.section-content")
    puts "This is a list of the most popular free apps available on the Apple App Store"
    puts  <<-DOC
    1. Love Balls
    2. Rise Up
    DOC
    
    app_1 = self.new
    app_1.name = "Love Balls"
    app_1.category = "Games"
    apps << app_1
    
    app_2 = self.new
    app_2.name = "Rise Up"
    app_2.category = "Games"
    apps << app_2
  end
  
end