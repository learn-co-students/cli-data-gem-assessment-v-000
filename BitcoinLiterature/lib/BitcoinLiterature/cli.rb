require_relative '../BitcoinLiterature'

class BitcoinLiterature::CLI

  def call
    make_a_search = true
    puts "Welcome to Gemini"
    while make_a_search == true
      BitcoinLiterature::Scrapper.new
      menu_list_of_documents
      make_a_search = new_request?
    end
  end

  def menu_list_of_documents
    puts "The documents available are:"
      display_documents
    puts "What document do you want more info on?"
    input = get_user_input
    if input.to_i > 0 && input.to_i <= BitcoinLiterature::Document.all.size
      document = BitcoinLiterature::Document.all[input.to_i - 1]
      display_documents_info(document)
    else
      puts "Selection unclear - please type the number of the document you want to check."
      sleep 3
      menu_list_of_documents
    end
  end

  def display_documents
      BitcoinLiterature::Document.all.each_with_index do |document, index|
        puts "#{index +1} - #{document.name}"
      end
  end

  def display_documents_info(document_object)
    puts "#{document_object.name} has been written by #{document_object.author} on #{document_object.date}\nYou can access the document here:#{document_object.url}"
  end

  def new_request?
    puts "Do you want to check another document? (Y/N)"
    user_input = get_user_input.downcase
    case user_input
    when "y"
      BitcoinLiterature::Document.reset
      true
    when "n"
      false
    else puts "selection_unclear - please type Y or N"
      new_request?
    end
  end

  def get_user_input
    gets.to_s.strip
  end

end
