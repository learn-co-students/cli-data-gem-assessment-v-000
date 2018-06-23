#class SimpleCollection::Scraper

  #def get_page
    #Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
  #end

  #def scrape_patterns_index
    #self.get_page.css()
  #end

  #def make_patterns
    #scrape_patterns_index.each do |p|
      #SimpleCollection::Patterns.new_from_index_page(p)
    #end
  #end
#end
