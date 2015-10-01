require 'spec_helper'
describe Luna::TransactionFactory do
  let(:factory) { Luna::TransactionFactory.new }
  let(:income)  { ["Income", "Oliva", "4000", "Income", "1"] }
  let(:expense) { ["Expense", "Oliva", "100", "Jeans", "1"] }

  before :each do
    factory.define(["Income", "Expense"])
  end

  describe "#build" do
    it "gives and income transaction" do
      transaction = factory.build(income)

      expect(transaction.type).to eq "Income"
      expect(transaction.name).to eq "Oliva"
      expect(transaction.amount).to eq "4000"
      expect(transaction.source).to eq "Income"
      expect(transaction.day).to eq "1"
    end

    it "gives an expense transaction" do
      transaction = factory.build(expense)

      expect(transaction.type).to eq "Expense"
    end

    context "when no transaction type is given" do
      it "does something that doesn't break the app" do
        #discuss the sad path & possible solutions
      end
    end
  end
end
