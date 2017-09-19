class TopWebApps::WebApps

  attr_accessor :name, :about, :url

  def self.web_apps
    puts "This should be the list of my top web application"

    web_app = self.new
    web_app.name = "Guesly web app"
    web_app.about = "It's about a life worth living "
    web_app.url = "compradelivery.com"

    [web_app]
  end

end
