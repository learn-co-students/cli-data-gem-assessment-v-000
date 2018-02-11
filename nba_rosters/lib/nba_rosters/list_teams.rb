class NbaRosters::Team

  def self.list
    #prints out list of all nba teams
    team_names []

    team_names << self.scrape_teams

    team_names
  end

  def self.scrape_teams
    doc = Nokogiri::HTML(open('http://www.nba.com/teams'))
    teams = doc.search("div.team__list_wrapper").text
    binding.pry
  end
end
