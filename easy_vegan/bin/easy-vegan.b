#!/usr/bin/env ruby
#loading my interpreter
#loading my environment

require_relative '../lib/easy_vegan'

#use require_relative for any files within program.

EasyVegan::CLI.new.call
