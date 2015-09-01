module Luna
  class Parser
    def initialize(file)
      @file = file
    end

    def parse_data
      lines = File.readlines(@file)
      lines = lines.map {|line| line.split("\n") }
      lines = lines.map {|t| t.first.split(" ")}
      lines
    end
  end
end
