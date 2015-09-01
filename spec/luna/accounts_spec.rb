require 'spec_helper'

describe Luna::Accounts do
  let (:datastore) { Luna::Accounts.new  }
  let (:account1)    { {:type=>"ADD", :name=>"Rose"} }
  let (:account2)    { {:type=>"ADD", :name=>"Tyler"} }

  describe '#save' do
    it "saves an account" do
      datastore.save(account1)

      expect(datastore.records["Rose"]).to eq account1
    end

    it 'can save more than one account' do
      datastore.save(account1)
      datastore.save(account2)

      expect(datastore.records["Tyler"]).to eq account2
    end
  end

  describe '#all' do
    it 'returns all accounts' do
      datastore.save(account1)
      datastore.save(account2)

      expect(datastore.all).to eq [account1, account2]
    end

    it 'returns an empty array if it has no accounts' do
      expect(datastore.all).to eq []
    end
  end

  describe '#find_by_name' do
    it 'finds a record by the name' do
      datastore.save(account1)

      expect(datastore.find_by_name("Rose")).to eq account1
    end
  end
end
