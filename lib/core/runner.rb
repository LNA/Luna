require 'lib/core/ui'
require 'lib/luna/repository'
require 'lib/luna/accounts'
module Core
  class Runner
    def initialize(config, parser, transaction_factory, router, ui)
      @config = config
      @parser = parser
      @router = router
      @transaction_factory = transaction_factory
      @ui = ui
    end

    def start
      @ui.welcome
      register_repository
      transactions = @parser.parse_data

      transactions.each do |transaction|
        if @config.include?(transaction.first)
          handle_valid(transaction)
          print_records
        end
      end
    end

    private

    def register_repository
      Luna::Repository.register(:account, Luna::Accounts.new)
    end

    def handle_valid(transaction)
      transaction    = @transaction_factory.build(transaction)
      handler        = @router.generate_handler(transaction)
      account = handler.respond(transaction)
      Repository.for(:account).save(account)
    end

    def print_records
      records = Luna::Repository.for(:account).records
      records.each do |record|
        @ui.print(record)
      end
    end

    def generate_handler(transaction)
      Router.generate_handler(transaction)
    end
  end
end
