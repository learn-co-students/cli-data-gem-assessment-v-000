require_relative '../config/environment'

url2="http://www.magsr.org/maleadopt.htm"
url="http://www.magsr.org/femaleadopt.htm"
Dog.create_from_webpage(url)
Dog.create_from_webpage(url2)
#Dog.magsr_fixer
Dog.save_output
