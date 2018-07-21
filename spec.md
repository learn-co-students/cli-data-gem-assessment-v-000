# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    My CLI ask initially for the user to seleect between 3 Super input methods.  First we have "enter a  name" which will prompt to enter the name of the hero directly.  for example "Iron Man" would return a result for the Superhero Iron Man.  ("iROn mAn" would also work!).  We can also select by comic studio.  after inputing "by studio" the user will be prompted to select from a list of either Marvel or DC Supers.  From there a display screen will show 10 heroes at a time and can be scrolled through via "next".  Entering a hero name from the list will return information on said Hero.  This method is great for searching for Supers you vaguely may know or to source where a hero creative roots lay.  Lastly there is a "random list" option that will aggregate and randomize the DC and MARVEL Supers and display them in the same format as by studio (10 at a time "next"able).  
- [x] Pull data from an external source
    My Super method scrapes in two ways.  Initially it is used via the class variable (which includes a class method) that scrapes Index pages of Marvel and DC heroes (i.e. .../list_of_dc and .../list_of_marvel) and creates 2 arrays (1 dc 1 marvel) of all valid Super names.  This variable is used when displaying heroes to the user via the random list and by studio methods.  The Super class scrapes again as it is initiated with a name.  During initializations the name validity is checked (with some sophistication), a studio is assigned, and gen_info is gathered.  During the gen_info gathering method  the Super's name is changed into a parameter to amend the website and return valid information scraped.
- [x] Implement both list and detail views
    Above are described two of three input methods ("random list" and "by studio") I believe to fulfill this requirement.  

https://github.com/rhogotargaryen/superhero
