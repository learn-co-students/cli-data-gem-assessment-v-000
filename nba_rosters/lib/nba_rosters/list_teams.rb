class NbaRosters::Team

  def self.list
    #prints out list of all nba teams
    teams_names []

    teams_names << self.scrape_teams
  end

  def self.scrape_teams
    doc = Nokogiri::HTML(open('http://www.nba.com/teams'))
  end
end
