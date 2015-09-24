module Luna
  class Transaction
    attr_accessor :income, :expense
    class << self
      def income(transaction)
        Struct.new("Income", :type, :name, :amount, :source, :day)
        Struct::Income.new(*transaction)
      end

      def expense(transaction)
        Struct.new("Expense", :type, :name, :amount, :source, :day)
        Struct::Expense.new(*transaction)
      end
    end
  end
end
