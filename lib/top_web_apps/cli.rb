class TopWebApps::CLI

  def call
    puts "Testing my apps "
    list_web_apps
    web_about
    bye
  end

  def list_web_apps
      @web_apps = TopWebApps::WebApps.web_apps
  end

  def web_about
    puts "Enter the number of the web to get more information on"


  end

  def bye
    puts "We hope that inspired you :)"
  end

end
