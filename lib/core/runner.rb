require 'lib/core/ui'
require 'lib/luna/handlers/income'
require 'lib/luna/handlers/expense'
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
      validate(@parser.parse_data)
      print_records
      @ui.final_record
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
      handler        = generate_handler(transaction)
      account        = handler.respond(transaction)
      Luna::Repository.for(:account).save(account)
    end

    def print_records
      records = Luna::Repository.for(:account).records
      records.each do |record|
        @ui.print(record)
      end
    end

    def generate_handler(transaction)
      klass = "Luna::Handlers::#{transaction.type}"
      Kernel.const_get(klass).new
    end
  end
end
