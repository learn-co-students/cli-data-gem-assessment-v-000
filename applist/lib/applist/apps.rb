class Applist::Apps
  attr_accessor :name, :category, :link
  
  def self.popular
    app_page = Nokogiri::HTML(open("https://www.apple.com/itunes/charts/free-apps/"))
    apps = []
    
    app_page.css("div.section-content li").each do |app|
      
      obj = { name: '', category: '', link: '' }
      apps << obj[:name] = [app.css("h3 a").text]
      apps << obj[:category] = [app.css("h4 a").text]
      apps << obj[:link] = [app.css("a").attribute("href").value]
      binding.pry  
    end
    
    apps.each do |app|
      doc = Nokogiri::HTML(open(app[:link]))
      #doc.css('.desc')
    
    end
    
  end
        
end