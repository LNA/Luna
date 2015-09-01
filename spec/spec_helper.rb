require 'rspec'
require 'pry'
require 'luna/accounts'
require 'luna/handlers/add_handler'

Dir["./lib/*.rb"].each { |file| require file }
