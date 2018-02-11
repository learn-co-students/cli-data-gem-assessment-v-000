class NbaRosters::Team

  def self.list
    #prints out list of all nba teams
    teams_names []

    teams_names << self.scrape_teams
  end

  def self.scrape_teams
    html = open('http://www.nba.com/teams')
  end
end
