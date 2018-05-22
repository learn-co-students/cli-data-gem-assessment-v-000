class Applist::Apps
  attr_accessor :name, :category, :link, :desc, :avg_rating
  
  def self.popular
    app_page = Nokogiri::HTML(open("https://www.apple.com/itunes/charts/free-apps/"))
    apps = []

      app_page.css("div.section-content li").each do |app|
        
        @app_obj = { name: '', category: '', link: '', desc: '', avg_rating: '' }
        @app_obj[:name] = [app.css("h3 a").text]
        @app_obj[:category] = [app.css("h4 a").text]
        @app_obj[:link] = [app.css("a").attribute("href").value]
        
          doc = Nokogiri::HTML(open(@app_obj[:link][0], 'User-Agent' => 'firefox'))
          @app_obj[:desc] = doc.css(".section__description").text
          @app_obj[:avg_rating] = doc.css(".we-customer-ratings__averages__display").text
        
        apps << @app_obj
      end

    apps
  end
        
end