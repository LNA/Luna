require 'spec_helper'
$: << File.expand_path(File.dirname(__FILE__))

describe Luna::TransactionFactory do
  let(:factory) { Luna::TransactionFactory.new }

  describe "#build" do
    it "gives and add transaction" do
      data = ["Add", "Oliva", "1000", "Income", "1"]
      transaction = factory.build(data)

      expect(transaction.type).to eq "Add"
      expect(transaction.name).to eq "Oliva"
      expect(transaction.amount).to eq "1000"
      expect(transaction.tag).to eq "Income"
      expect(transaction.day).to eq "1"
    end

    it "gives a draw transaction" do
      data = ["Draw", "Oliva", "1000", "SelfCare", "1"]
      transaction = factory.build(data)

      expect(transaction.type).to eq "Draw"
    end

    it "gives a pay transaction" do
      data = ["Pay", "Oliva", "1000", "BlueInc", "1"]
      transaction = factory.build(data)

      expect(transaction.type).to eq "Pay"
    end

    context "when no transaction type is given" do
      it "does something that doesn't break the app" do
        #discuss the sad path & possible solutions
      end
    end
  end
end
