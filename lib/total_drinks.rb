require_relative "total_drinks/version"
require_relative "total_drinks/cli"
require_relative "total_drinks/api"
require_relative "total_drinks/totaldrinks"

require 'rest-client'
require 'colorize'
require 'json'
require 'pry'
require 'colorized_string'

module TotalDrinks
  class Error < StandardError; end
  # Your code goes here...
end
