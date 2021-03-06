module Core
  class UI
    BLANK_LINE = ".........................................."
    WELCOME_MESSAGE = "Welcome! Here are your transactions: "
    BALANCE_MESSAGE = "Your balance on Day 30 is "

    def welcome
      puts WELCOME_MESSAGE
    end

    def print(record_number, record)
      puts " Record No. #{record_number}: Person: #{record.name},
               Type  : #{record.type},
               Amount: #{record.amount},
               Source: #{record.source}
               "
    end

    def final_record
      puts BALANCE_MESSAGE
    end

    def blank_line
      puts BLANK_LINE
    end
  end
end
