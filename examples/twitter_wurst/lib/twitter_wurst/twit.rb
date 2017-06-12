require 'open-uri'
require 'nokogiri'

class TwitterWurst::Twit
  attr_accessor :name, :handle, :url, :tweets

  def initialize(handle, url)
    doc = Nokogiri::HTML(open"(https://www.twitter.com/#{:handle}")
    @tweets = []
    @name = doc.search("h1.ProfileHeaderCard-name a").text - "Verified account"
    @handle = handle
    @url = url
  end

end
