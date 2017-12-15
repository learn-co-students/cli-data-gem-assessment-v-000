require_relative "Cleveland_Museum_Events/version"

module ClevelandEvents
  require 'pry'
  require 'nokogiri'
  require 'open-uri'

  #require 'bundler'
  #Bundler.require

  require_relative './Cleveland_Museum_Events/cli'
  require_relative './Cleveland_Museum_Events/events'
  require_relative './Cleveland_Museum_Events/version'

end
