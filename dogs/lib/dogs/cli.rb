class Dogs::CLI

  def call
    puts "hello world"
    Dogs::Scraper.scrape_dogs
    list_dogs
  end

  def list_dogs
    Dogs::DogsPopularity.all.each do |dog|
      puts "#{dog.name}"
    end
  end

end
