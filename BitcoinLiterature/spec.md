# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
  Created a CLI object in charge of all user interactions such as prompting non scraped data.
  I used this object to handle edge cases and to make sure that user inputs are always understood by the program or ask for a valid selection if not

- [x] Pull data from an external source
  Created a scrapper object in charge of getting the data from the Nakamoto Institute website. This object collects the data a instantiate a Document object to store the data

- [x] Implement both list and detail views
  Through the 3 objects I created, the program provides an initial list of documents and provide additional information for the one selected.
  Each documents is stored as an instance of a Document object and details of this object can be queried as needed
