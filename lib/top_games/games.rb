class TopGames::Game

attr_accessor :name, :release_date, :summary
    
   def self.ranking #games array caller 
     self.scrape_games
   end 
    
    def self.summary #summary array caller
      self.scrape_summary
    end 
    
    
     def self.scrape_games #game save method
       games = []
       
       games << self.scrape_kingdom
       games << self.scrape_divinity
       games << self.scrape_path
     end 
    
     def self.scrape_summary #summary save method
      summary = [] 
      
      summary << self.scrape_story_1
      summary << self.scrape_story_2
      summary << self.scrape_story_3
    end
    
    def self.scrape_kingdom #scraper for kingdom come (name, dev, and release date)
      doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
     
      game_1 = self.new 
      game_1.name = doc.search("h3#kingdom-come-deliverance").text
      game_1.release_date = doc.search('p')[7].text
      game_1 
    end 
    
    def self.scrape_divinity #scraper for divinity 
      doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
      
      game_2 = self.new 
      game_2.name = doc.search("h3#divinity-original-sin-2").text
      game_2.release_date = doc.search('p')[11].text
      game_2
    end 
    
    def self.scrape_path #scraper for path of exile 
      doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
      
      game_3 = self.new 
      game_3.name = doc.search("h3#path-of-exile").text
      game_3.release_date = doc.search('p')[44].text
      game_3
   end 
  
   def self.scrape_story_1 #kingdom come summary 
     doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
     
     summary_1 = self.new 
     summary_1 = doc.search('p')[8].text #kingdom come summary 
     summary_1
   end 
   
    def self.scrape_story_2 #divinity summary 
     doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
    
     summary_2 = self.new 
     summary_2 = doc.search('p')[12].text #divinity summary 
     summary_2
    end 
   
     def self.scrape_story_3 #path of exile summary 
     doc = Nokogiri::HTML(open("https://www.pcgamer.com/best-rpgs-of-all-time/"))
    
     summary_3 = self.new 
     summary_3 = doc.search('p')[45].text #path summary 
     summary_3
    end 
    
    
  
end 