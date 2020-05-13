# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
- [ ] Pull data from an external source
- [ ] Implement both list and detail views

How to build a CLI Gem

	1. Plan your gem, imagine your interface
    program prompts user for zipcode
    user enter meetup zipcode
    -list Meetups
    show a list of Meetups
    which meetup are you interested in, enter selection number?
    user enters selection number
    -display details for meet up selected
    Would you like to check out another meet up, enter selection number or enter exit?
    user enters another selection number

    select desired meetup for details
	2. Start with the project structure - google
	3. Start with the entry point - the file run
	4. Force that to build the CLI interface
	5. Stub out the interface
	6. Start making things real
	7. Discover objects
	8. Program
