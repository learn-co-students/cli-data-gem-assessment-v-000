class Applist::Apps
  attr_accessor :name, :category, :link
  
  def self.popular
    app_page = Nokogiri::HTML(open("https://www.apple.com/itunes/charts/free-apps/"))
    apps = []
    
    app_page.css("div.section-content li").each do |app|
      
      obj = { name: '', category: '', link: '' }
      obj[:name] = [app.css("h3 a").text]
      obj[:category] = [app.css("h4 a").text]
      obj[:link] = [app.css("a").attribute("href").value]
      apps << obj
    end
    
    apps.each do |app|
      
      doc = Nokogiri::HTML(open(app[:link][0]))
      #doc.css('.desc')
      binding.pry
    end
    
  end
        
end