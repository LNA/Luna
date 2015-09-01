module Luna
  class TransactionFactory

    ADD  = "Add"
    DRAW = "Draw"

    def build(transaction)
      if add?(transaction)
        Luna::Transaction.add(transaction)
      elsif draw?(transaction)
        Luna::Transaction.draw(transaction)
      else
        Luna::Transaction.pay(transaction)
      end
    end

    private

    def add?(transaction)
      transaction.first == ADD
    end

    def draw?(transaction)
      transaction.first == DRAW
    end
  end
end
