module CrowdFund
  module Fundable
    
    def add_funds(fund=25)
      self.funding += fund
      puts "Project #{self.name} got more #{fund} dollars!"
    end

    def remove_funds(fund=15)
      self.funding -= fund
      puts "Project #{self.name} lost #{fund} dollars!"
    end

    def fully_funded?
      self.remaining_funding <= 0
    end

  end
end