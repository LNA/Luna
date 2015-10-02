require 'spec_helper'

describe Luna::Accounts do
  let (:datastore)   { Luna::Accounts.new  }
  let (:account_1)   { {:type=>"INCOME", :name=>"Rose"} }
  let (:account_2)   { {:type=>"INCOME", :name=>"Tyler"} }

  describe '#save' do
    it "saves an account" do
      datastore.save(account_1)

      expect(datastore.records[1]).to eq account_1
    end

    it 'can save more than one account' do
      datastore.save(account_1)
      datastore.save(account_2)

      expect(datastore.records[2]).to eq account_2
    end
  end

  describe '#all' do
    it 'returns all accounts' do
      datastore.save(account_1)
      datastore.save(account_2)

      expect(datastore.all).to eq [account_1, account_2]
    end

    context 'when no accounts exist' do
      it 'returns an empty array' do
        expect(datastore.all).to eq []
      end
    end
  end

  describe '#find_by_id' do
    it 'finds a record by the name' do
      datastore.save(account_1)
      datastore.save(account_2)

      expect(datastore.find_by_id(1)).to eq account_1
      expect(datastore.find_by_id(2)).to eq account_2
    end

    context 'when no record is found' do
      it 'does not give nil' do
        null_object_pattern = {}
        expect(datastore.find_by_id(33)).to eq null_object_pattern
      end
    end
  end
end
