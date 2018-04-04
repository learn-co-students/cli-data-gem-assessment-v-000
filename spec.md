# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      The `CLI` class is resonsible for interfacing with the application and works as expected.
- [X] Pull data from an external source
      In the `Scraper` class, I've scraped different pages from a few websites (astrology-zodiac-signs.com, cafeastrology.com, and astrology.com) for different horoscope readings.
- [X] Implement both list and detail views
      The `current_readings` method inside of the `Scraper` class provides the user with with both a short description of the horoscope reading that they'd like to view as well as the URL to the page from which the given reading was scraped, allowing them to easily read more about any viewed horoscope. Additionally, they may view more readings about the same chosen sign or choose another sign to view readings for through the `CLI`.
