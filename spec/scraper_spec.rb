require "spec_helper"

describe "Scraper" do
  
  # let!(:portals_index_array) {[{:main_topic=>"General reference", :portal_name=>"Library and information science", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Library_and_information_science"},
  #                             {:main_topic=>"Culture and the arts", :portal_name=>"Culture", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Culture"},
  #                             {:main_topic=>"Culture and the arts", :portal_name=>"Language", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Language"}]}

  describe "#scrape_portals_page" do
    it "is a class method that scrapes portal topics ('https://en.wikipedia.org/wiki/Portal:Contents/Portals') and a hash in which each value is an array of portal page links" do
      portals_page = "https://en.wikipedia.org/wiki/Portal:Contents/Portals"
      scraped_portals = Scraper.scrape_portals_page(topic_selection)
      expect(scraped_portals).to be_a(Hash)
      expect(scraped_portals).has_key?(:"Culture and the arts").to eq(true)
      #expect(scraped_portals).has_key?(:"Technology and applied sciences").to eq(true)
      #expect(scraped_portals).has_key?(:"Philosophy and thinking").to eq(true)
      #expect(scraped_portals).to include(portals_index_array[0], portals_index_array[1], portals_index_array[2])
    end
  end

  describe "#scrape_portal_dyk" do
    it "is a class method that scrapes a portal's Did You Know section and creates a new Hash whose keys are the main topic and values are all of the Did You Know content from each portal page" do
      profile_url = "./fixtures/student-site/students/joe-burgess.html"
      scraped_portal = Scraper.scrape_portal_dyk
      expect(scraped_portal).to be_a(Hash)
      expect(scraped_portal)[:"Culture and the arts"].to be_a(Array)
      expect(scraped_portal)[:"Culture and the arts"].include?("...that Esperanto is a constructed human language?").should eq(true)
      #expect(scraped_student).to match(student_joe_hash)
    end
  end
end