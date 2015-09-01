module Core
  class UI
    BLANK_LINE = "  "

    def welcome
      BLANK_LINE
      puts "Welcome! Calculation..."
      BLANK_LINE
    end

    def print(record)
      puts "#{record}"
    end

    def final_record
      BLANK_LINE
      puts "Balance on Day 30: "
      BLANK_LINE
    end
  end
end
