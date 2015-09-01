module Luna
  class Transaction
    attr_accessor :add, :draw, :pay
    class << self
      def add(transaction)
        Struct.new("Add", :type, :name, :amount, :tag, :day)
        Struct::Add.new(*transaction)
      end

      def draw(transaction)
        Struct.new("Draw", :type, :name, :amount, :tag, :day)
        Struct::Draw.new(*transaction)
      end

      def pay(transaction)
        Struct.new("Pay", :type, :name, :amount, :tag, :day)
        Struct::Pay.new(*transaction)
      end
    end
  end
end
