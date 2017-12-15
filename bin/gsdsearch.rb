require_relative '../config/environment'

url2="https://www.magsr.org/maleadopt.htm"
url="https://www.magsr.org/femaleadopt.htm"
Dog.create_from_webpage(url)
Dog.create_from_webpage(url2)
#Dog.magsr_fixer(Dog.all)
Dog.save_output
