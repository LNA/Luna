require 'spec_helper'

$: << File.expand_path(File.dirname(__FILE__))

describe Luna::Parser do
  let (:parser) { Luna::Parser.new("spec/test_data/test.txt") }

  describe "parse_data" do
    it "gives separate transactions" do
      transactions = parser.parse_data
      expect(transactions.count).to eq 2
    end

    context 'when no file given' do
      it "does sad path" do

      end
    end
  end
end
