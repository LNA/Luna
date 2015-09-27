module Luna
  class TransactionFactory

    INCOME  = "Income"

    def define(transactions)
      transactions.each do |transaction|
        Struct.new(transaction, :type, :name, :amount, :source, :day)
      end
    end

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

    def build_income(transaction)
      Struct::Income.new(*transaction)
    end

    def build_expense(transaction)
      Struct::Expense.new(*transaction)
    end
  end
end
