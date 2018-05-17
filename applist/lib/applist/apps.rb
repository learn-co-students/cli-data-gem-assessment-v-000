class Applist::Apps
  attr_accessor :name, :category
  
  def self.popular
    app_page = Nokogiri::HTML(open("https://www.apple.com/itunes/charts/free-apps/"))
    apps = {}
    
    app_page.css("div.section-content li").each do |app|
      #apps << app.css("h3 a").text
      
      if app.css("h3 a").text
        apps[:name] = app.css("h3 a").text
      elsif app.css("h4 a").text
        apps[:category] = app.css("h4 a").text
      end
      
      binding.pry
        
    end
  end
  
end