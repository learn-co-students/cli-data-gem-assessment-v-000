# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      ComingSoon::CLI
        get_and_list_movies => scrape data
        menu_selection      => display menu of movies
        list_saved_movies   => re-list movies
        goodbye  	          => say goodbye
- [x] Pull data from an external source
      Scrape and save the data using nokogiri and open-uri
      ComingSoon::Movie
        self.scrape_movies    => scrape movies
                              name, start_date, url
        self.scrape_synopsis  => scrape Overview
                              synopsis
- [x] Implement both list and detail views
    - User types coming-soon
    - Show a numbered list of movies
    - display 'You may enter a movie number for more details or "list" to see the menu again or "exit"'
    - if a number between 1 and the number of the last movie in the list
          display the movie name followed by a synopsis of the movie
    - if 'list'
          display the saved list of movies
    - if 'exit'
          exit the application
    - else
          display 'Invalid selection!'
          re-display ''You may enter a movie number for more details or "list" to see the menu again or "exit"''
