require_relative 'project'

module CrowdFund
  class MatchingProject < Project

    def half_funded?
      self.remaining_funding <= (@target / 2.0)
    end

    def match_funds(amount)
      if half_funded?
        @funding += amount
        puts "Project #{@name} received matching funds"
      end
    end

    def received_pledge(pledge)
      super
      match_funds(pledge.amount)
    end

    def add_funds(funds=25)
      super
      match_funds(funds)
    end

  end
end