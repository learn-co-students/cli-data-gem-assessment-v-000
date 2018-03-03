require_relative '../BitcoinLiterature'

  class BitcoinLiterature::Scrapper
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

    def display_documents
      puts "Doc 1"
      puts "Doc 2"
      puts "Doc 2"
    end

    def number_of_documents
      3
    end

    def display_documents_info(input)
      case input
      when "1"
        puts "/Doc 1/ has been written by /X/ on /date/"
      when "2"
        puts "/Doc 2/ has been written by /X/ on /date/"
      when "3"
        puts "/Doc 3/ has been written by /X/ on /date/"
      end
    end

  end
