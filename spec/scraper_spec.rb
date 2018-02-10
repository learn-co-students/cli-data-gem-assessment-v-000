require "spec_helper"

describe "Scraper" do
  
  let!(:portals_index_array) {[{:main_topic=>"General reference", :portal_name=>"Library and information science", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Library_and_information_science"},
                               {:main_topic=>"Culture and the arts", :portal_name=>"Culture", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Culture"},
                               {:main_topic=>"Culture and the arts", :portal_name=>"Language", :portal_url=>"https://en.wikipedia.org/wiki/Portal:Language"}]}

  describe "#scrape_portals_page" do
    it "is a class method that scrapes portal topics ('https://en.wikipedia.org/wiki/Portal:Contents/Portals') and a returns an array of hashes in which each hash represents one student" do
      portals_page = "https://en.wikipedia.org/wiki/Portal:Contents/Portals"
      scraped_portals = Scraper.scrape_portals_page
      expect(scraped_portals).to be_a(Array)
      expect(scraped_portals.first).to have_key(:main_topic)
      expect(scraped_portals.first).to have_key(:portal_name)
      expect(scraped_portals.first).to have_key(:portal_url)
      expect(scraped_portals).to include(portals_index_array[0], portals_index_array[1], portals_index_array[2])
    end
  end

  # describe "#scrape_portal_dyk" do
  #   it "is a class method that scrapes a portal's Did You Know section and returns a hash of attributes describing an individual portal" do
  #     profile_url = "./fixtures/student-site/students/joe-burgess.html"
  #     scraped_student = Scraper.scrape_profile_page(profile_url)
  #     expect(scraped_student).to be_a(Hash)
  #     expect(scraped_student).to match(student_joe_hash)
  #   end

  #   it "can handle profile pages without all of the social links" do
  #     profile_url = "./fixtures/student-site/students/david-kim.html"
  #     scraped_student = Scraper.scrape_profile_page(profile_url)
  #     expect(scraped_student).to be_a(Hash)
  #     expect(scraped_student).to match(student_david_hash)
  #   end
  # end
end