module Luna
  class Accounts
    attr_accessor :name, :records

    def initialize
      @records = {}
    end

    def save(account)
      @records[account[:name]] = account
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
