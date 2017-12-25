
[1mFrom:[0m /home/mietone/cli-data-gem-assessment-v-000/coffee_roasters/lib/coffee_roasters/roaster.rb @ line 14 CoffeeRoasters::Roaster.scrape_roasters:

     [1;34m9[0m:   [32mdef[0m [1;36mself[0m.[1;34mscrape_roasters[0m
    [1;34m10[0m:     roasters = []
    [1;34m11[0m: 
    [1;34m12[0m:     doc = [1;34;4mNokogiri[0m::HTML(open([31m[1;31m"[0m[31mhttps://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country[1;31m"[0m[31m[0m))
    [1;34m13[0m: 
 => [1;34m14[0m: binding.pry
    [1;34m15[0m: 
    [1;34m16[0m:     roaster = [1;36mself[0m.new
    [1;34m17[0m:     roaster.name = doc.search([31m[1;31m"[0m[31mh1 a.save-venue__link[1;31m"[0m[31m[0m).text
    [1;34m18[0m:     roaster.location = doc.search([31m[1;31m"[0m[31mh2.save-venue__neighborhood[1;31m"[0m[31m[0m).text
    [1;34m19[0m:     roaster.bean = doc.at([31m[1;31m"[0m[31mp.save-venue__description[1;31m"[0m[31m[0m).text.split([31m[1;31m"[0m[31m[1;35m\n[0m[31m[1;31m"[0m[31m[0m)[[1;34m0[0m]
    [1;34m20[0m:     roaster.details = doc.at([31m[1;31m"[0m[31mp.save-venue__description[1;31m"[0m[31m[0m).text.split([31m[1;31m"[0m[31m[1;35m\n[0m[31m[1;31m"[0m[31m[0m)[[1;34m2[0m]
    [1;34m21[0m:     roaster.url = doc.search([31m[1;31m"[0m[31ma.save-venue__link[1;31m"[0m[31m[0m).attr([31m[1;31m"[0m[31mhref[1;31m"[0m[31m[0m).value
    [1;34m22[0m: 
    [1;34m23[0m:     roasters << roaster
    [1;34m24[0m: 
    [1;34m25[0m:     [1;34m# go to site[0m
    [1;34m26[0m:     [1;34m# extract properties[0m
    [1;34m27[0m:     [1;34m# instantiate Roasters[0m
    [1;34m28[0m: 
    [1;34m29[0m:     roasters
    [1;34m30[0m:   [32mend[0m

