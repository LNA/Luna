require 'lib/core/ui'

class Runner
  def initialize(ui)
    @ui = ui
  end

  def start
    @ui.welcome
  end
end
