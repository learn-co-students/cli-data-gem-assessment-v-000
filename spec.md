# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      My application is able to show a list of matches, and then accept input from the user
      to show information about a specific match. It is also capable of discerning valid input from invalid. The CLI also greets and says goodbye to the user.
- [x] Pull data from an external source
      ShootingMatchFinder scrapes data from https://practiscore.com/search/matches, and also scrapes from each match's respective detail page.
- [x] Implement both list and detail views
      The application has a list_matches method, which lists out all scraped matches in numerical order, and also a #menu method, which is what allows a user to select and view details of a specific match.
