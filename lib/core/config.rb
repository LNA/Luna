module Core
  class Config
    class << self
      def transaction_types
        [:income, :expense]
      end
    end
  end
end
