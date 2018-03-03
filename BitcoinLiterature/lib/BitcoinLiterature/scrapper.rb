require_relative '../BitcoinLiterature'

  class BitcoinLiterature::Scrapper
    def initialize
      self.scrap_website
    end

    def scrap_website
      @doc = Nokogiri::HTML(open("http://nakamotoinstitute.org/literature/"))
      puts "scrapping website"
      scrap_table
      #binding.pry
    end

    def scrap_table
      table = @doc.at('table').css('tbody')

      table.search('tr').each do |tr|
        #binding.pry
        column_count = 0
        document = BitcoinLiterature::Document.new

        tr.search('td').each do |td|
          case (column_count % 4)
          when 0
            document.name = td.text.strip.tr('"', '')
            document.url = td.attr("href")
            binding.pry
          #when 1 - not used as we don't collect formats
          when 2
            document.author = td.text.strip
          when 3
            document.date = td.text.strip
          end
          column_count +=1
        end
        document.save
      end
    end

  end
