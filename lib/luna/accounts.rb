module Luna
  class Accounts
    attr_accessor :name, :records

    def initialize
      @records = {}
      @id = 1
    end

    def save(account)
      @records[@id] = account
      @id += 1
      account
    end

    def all
      @records.values
    end

    def find_by_name(name)
      @records[name]
    end
  end
end
