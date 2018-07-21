require_relative '../Gemini'

  class Gemini::Scrapper
    def initialize
      self.scrap_website
    end

    def scrap_website
      @doc = Nokogiri::HTML(open("http://nakamotoinstitute.org/literature/"))
      @document_name =[]
      @document_author =[]
      @document_date =[]
      puts "scrapping website"
      scrap_table
      binding.pry
    end

    def scrap_table
      table = @doc.at('table')

      table.search('tr').each do |tr|
        column_count = 0
        tr.search('td').each do |td|
          case (column_count % 4)
          when 0
            @document_name << td.text.strip
          #when 1 - not used as we don't collect formats
          when 2
            @document_author << td.text.strip
          when 3
            @document_date << td.text.strip
          end
          column_count +=1
        end
      end
    end

    def display_pairs
      puts "1 - BTC/USD"
      puts "2 - ETH/USD"
      puts "3 - ETH/BTC"
    end

    def number_of_results
      3
    end

    def display_percentage_and_variations(input)
      case input
      when "1"
        puts "1 BTC = $10000"
        puts "The price increased/decreased by XX%"
      when "2"
        puts "1 ETH = $800"
        puts "The price increased/decreased by YY%"
      when "3"
        puts "1 ETH = 0.070000000 BTC "
        puts "The price increased/decreased by ZZ%"
      end
    end

  end
