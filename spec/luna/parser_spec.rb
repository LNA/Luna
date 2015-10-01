require 'spec_helper'

$: << File.expand_path(File.dirname(__FILE__))

describe Luna::Parser do
  let (:parser) { Luna::Parser.new("spec/test_data/test.txt") }

  describe "parse_data" do
    it "gives separate transactions" do
      transactions = parser.parse_data
      expect(transactions.count).to eq 2
    end

    context 'when source of income/expense is made of 2 words' do
      it "does something different" do

      end
    end
  end
end
