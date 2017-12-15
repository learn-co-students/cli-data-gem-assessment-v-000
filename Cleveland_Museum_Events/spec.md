# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application  -  The CLI uses user input to determine if they want to know more about the current events happening at the Cleveland Art Museum and then displays a list of the next 12 events and descriptions of whichever events they select.  The user prompted if they would like to view any other events and returned to the main list.  This continues until the user decides to quit by entering "No" or "n" into the command line when prompted.
- [x] Pull data from an external source  -  events.rb contains scrapers that pull data from www.clevelandart.org and return values of titles, descriptions and urls.
- [x] Implement both list and detail views -  The list view displays the next 12 events happening at the art museum.  The user is then asked which event they would like to know more about.  Once their input is entered a detailed view of the event they selected with the events title, description and url is displayed.  
