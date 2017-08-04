require_relative './scraper'
require_relative './ailments'

class CommandLineInteface

  def call
    puts 'Welcome to Hebal Remedies'
    puts'Choose from the following options'
    puts '1. Herbal Remdies for Common Ilnesess'
    Ailment.create_from_hash(Scraper.ailment_remedy_hash)
    puts Scraper.scrape_ailments
      # user input
      # print herbal remedy
    # puts '2. Could Herbal tretments be harmful?'

    # Ailments.new(Scraper.ailment_remedy_hash)
  end

  def all_ailments

  end


end
