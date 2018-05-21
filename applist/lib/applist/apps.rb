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
      
      apps << @app_obj
    #  binding.pry
    end
    
    apps.each do |app|
      
      #doc = Nokogiri::HTML(open(app[:link][0], 'User-Agent' => 'firefox'))
      
      url = app[:link][0]
      puts url
      content = open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'firefox')
      doc = Nokogiri::HTML(content)
      #binding.pry
      @app_obj[:desc] = doc.css(".section__description").text
      @app_obj[:avg_rating] = doc.css(".we-customer-ratings__averages__display").text
      apps << @app_obj
      
    end
    apps
  end
        
end

# puts "checking #{array.length} items"
# array.each_with_index(1) do |item, index|
#   # do stuff 
#   puts "#{index} checked"
# end