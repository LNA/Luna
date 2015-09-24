$: << File.expand_path(File.dirname(__FILE__))
require 'lib/core/ui'
require 'lib/core/config'
require 'lib/core/runner'

require 'lib/luna/parser'
require 'lib/luna/transaction_factory'
require 'lib/luna/router'

config              = Core::Config.transaction_types
file                = 'data/sample.txt'
parser              = Luna::Parser.new(file)
transaction_factory = Luna::TransactionFactory.new
router              = Luna::Router.new
ui                  = Core::UI.new

runner = Core::Runner.new(config, parser, transaction_factory, router, ui)

runner.start
