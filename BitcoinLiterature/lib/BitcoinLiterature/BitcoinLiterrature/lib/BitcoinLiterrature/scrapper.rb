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
<<<<<<< HEAD:BitcoinLiterature/lib/BitcoinLiterature/scrapper.rb
=======
        document.save
>>>>>>> abd942bb1841cffa23f3ae7d81e82d085e17abc9:BitcoinLiterature/lib/BitcoinLiterature/BitcoinLiterrature/lib/BitcoinLiterrature/scrapper.rb

        tr.search('td').each do |td|
          case (column_count % 4)
          when 0
<<<<<<< HEAD:BitcoinLiterature/lib/BitcoinLiterature/scrapper.rb
            document.name = td.text.strip.tr('"', '')
            document.url = td.css("a").attr("href").value.prepend("http://nakamotoinstitute.org")
            binding.pry
=======
            document.name = td.text.strip
>>>>>>> abd942bb1841cffa23f3ae7d81e82d085e17abc9:BitcoinLiterature/lib/BitcoinLiterature/BitcoinLiterrature/lib/BitcoinLiterrature/scrapper.rb
          #when 1 - not used as we don't collect formats
          when 2
            document.author = td.text.strip
          when 3
            document.date = td.text.strip
          end
          column_count +=1
        end
<<<<<<< HEAD:BitcoinLiterature/lib/BitcoinLiterature/scrapper.rb
        document.save
=======
        binding.pry
>>>>>>> abd942bb1841cffa23f3ae7d81e82d085e17abc9:BitcoinLiterature/lib/BitcoinLiterature/BitcoinLiterrature/lib/BitcoinLiterrature/scrapper.rb
      end
    end

  end
