# Intended Behavior of National Parks CLI APP #

1) Scrape state_page
    "https://www.nps.gov/findapark/index.htm"
    
    state_page.css.(map#Map area).each do |state|
      state_name = "#{state.attr("alt")}"
      state_link = "#{state.attr("href")}"
      
      states << {name: state_name, link: state_link}
    end