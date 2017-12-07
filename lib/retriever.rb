require 'open-uri'
require 'pry'
require 'nokogiri'

#takes in a URL page of adoptable MAGSR format and scrapes for .Dog attributes
class Retriever(adopt_page)
  html = File.read(adopt_page)
  dogs_html = Nokogiri::HTML(html)
  dogs = []
      dogs.html.css("div.panel-2col-stacked.clearfix.panel-display").each do |dog_frame|
      end










end #RETRIEVER
