module Luna
  class Accounts
    attr_accessor :name, :records

    def initialize
      @records = {}
      @id = 1
    end

    def save(account)
      account.tap do |a|
        @records[@id] = a
        @id += 1
      end
    end

    def all
      @records.values
    end

    def find_by_id(id)
      @records[id] || {}
    end
  end
end
