$: << File.expand_path(File.dirname(__FILE__))
require 'lib/core/ui'
require 'lib/core/runner'

ui = Core::UI.new

runner = Runner.new(ui)

runner.start
