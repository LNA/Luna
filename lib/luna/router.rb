module Luna
  class Router
    require 'lib/luna/handlers/income'
    require 'lib/luna/handlers/expense'

    class << self
      def generate_handler(transaction)
        type = transaction.type
        klass = "Luna::Handlers::#{type}Handler"
        Kernel.const_get(klass).new
      end
    end
  end
end
