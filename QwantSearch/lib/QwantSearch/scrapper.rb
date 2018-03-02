require_relative '../QwantSearch'

#test
  class QwantSearch::Scrapper

    def createURL(input)
      @link = ("&t=all").prepend(input.gsub(" ","%20")).prepend("https://www.qwant.com/?q=")
    end

    def scrap_website
      @doc = Nokogiri::HTML(open(@link))
      # create_XML_document_with_selenium_webriver
      #create_XML_document_with_watir_webriver
      scrap_search_results
      scrap_results_descriptions
      #binding.pry
    end

    # def create_XML_document_with_selenium_webriver
    #   #Selenium::WebDriver::Chrome.driver_path = './geckodriver.exe'
    #   driver = Selenium::WebDriver.for :firefox
    #   driver.navigate.to @link
    #   sleep 2.0
    #   html = driver.find_element("result_actions")
    # end

    #def create_XML_document_with_watir_webriver
      #browser = Watir::Browser.new :firefox
    #  driver = Selenium::WebDriver.for :edge
    #  driver.navigate.to @link
    #  sleep 2.0
    #  html = driver.find_element("result_actions")
    #end

    def number_of_results
      @results.length
    end

    def scrap_search_results
      @results =[]
      #code to scrap and push the results in the @ results array
        #to come

      #temporary results tab
      @results =["Result 1","Result 2","Result 3","Result 4","Result 5"]
    end

    def scrap_results_descriptions
      @descriptions =[]
      #code to scrap and push the description in the @descriptions array
        #to come

      #temporary results tab
      @descriptions =["Description 1","Description 2","Description 3","Description 4","Description 5"]
    end

    def display_results
      @results.each_with_index do |result, index|
        puts "#{index+1} - #{result}"
      end
    end

    def display_description(input)
      puts "#{@descriptions[input.to_i-1]}"
    end
end
