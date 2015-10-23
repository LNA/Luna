require 'lib/core/ui'
require 'lib/luna/repository'
require 'lib/luna/accounts'
module Core
  class Runner
    def initialize(config, parser, transaction_factory, ui)
      @config = config
      @parser = parser
      @transaction_factory = transaction_factory
      @ui = ui
    end

    def start
      @ui.welcome
      register_repository
      @transaction_factory.define(@config)
      validate(@parser.parse_data)
      print_records
      @ui.blank_line
      @ui.final_record
      puts calculate_balance
    end

    private

    def register_repository
      Luna::Repository.register(:account, Luna::Accounts.new)
    end

    def validate(transactions)
      transactions.each do |transaction|
        if @config.include?(transaction.first)
          handle_valid(transaction)
        end
      end
    end

    def handle_valid(transaction)
      transaction    = @transaction_factory.build(transaction)
      Luna::Repository.for(:account).save(transaction)
    end

    def print_records
      records = Luna::Repository.for(:account).records
      records.each do |record|
        @ui.print(record.first, record.last)
      end
    end

    def calculate_balance
      records = Luna::Repository.for(:account).records
      balance = 0
      records.each do |r|
        balance += r.last.amount.to_i if r.last.type == "Income"
        balance -= r.last.amount.to_i if r.last.type == "Expense"
      end
      balance
    end
  end
end
