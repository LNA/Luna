module Core
  class Config
    class << self
      def transaction_types
        ["Add", "Draw", "Pay"]
      end
    end
  end
end
