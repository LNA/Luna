module Core
  class UI
    BLANK_LINE = "  "
    WELCOME_MESSAGE = "Welcome! Calulating..."
    BALANCE_MESSAGE = "Balance on Day 30: "

    def welcome
      BLANK_LINE
      puts WELCOME_MESSAGE
      BLANK_LINE
    end

    def print(record)
      puts "#{record}"
    end

    def final_record
      BLANK_LINE
      puts BALANCE_MESSAGE
      BLANK_LINE
    end
  end
end
