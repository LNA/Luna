module Luna
  class TransactionFactory

    INCOME  = "Income"
    EXPENSE = "Expense"

    def build(transaction)
      if income?(transaction)
        build_income(transaction)
      else
        build_expense(transaction)
      end
    end

    private

    def income?(transaction)
      transaction.first == INCOME
    end

    def expense?(transaction)
      transaction.first == EXPENSE
    end

    def build_income(transaction)
      Struct.new("Income", :type, :name, :amount, :source, :day)
      Struct::Income.new(*transaction)
    end

    def build_expense(transaction)
      Struct.new("Expense", :type, :name, :amount, :source, :day)
      Struct::Expense.new(*transaction)
    end
  end
end
