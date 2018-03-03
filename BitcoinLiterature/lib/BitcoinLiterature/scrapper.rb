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
      #binding.pry
    end

    def scrap_table
      table = @doc.at('table')

      table.search('tr').each do |tr|
        column_count = 0
        tr.search('td').each do |td|
          #binding.pry
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
      @document_name.each_with_index do |document,index|
        puts "#{index + 1} - #{@document_name[index].tr('"', '')}\n"
      end

    end

    def number_of_documents
      @document_name.length
    end

    def display_documents_info(input)
      index = input.to_i - 1
      puts "#{@document_name[index]} has been written by #{@document_author[index]} on #{@document_date[index]}"
    end

  end
