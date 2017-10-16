class Start_Your_Day::CLI

  def welcome

  end

  def list day_starters
    puts "Begin your day"
    puts "  date/day of the year "
    puts <<-DOCS
      1. https://www.dailyzen.com/
      2. https://www.dailywritingtips.com/
      3. https://www.merriam-webster.com/word-of-the-day
      4.https://www.aspeninstitute.org/ideas/
    DOCS

  end




end
