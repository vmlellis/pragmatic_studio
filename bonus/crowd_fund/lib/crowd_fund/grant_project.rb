require_relative 'project'

module CrowdFund
  class GrantProject < Project
    def remove_funds
      puts "Can't remove funds from #{@name}."
    end
  end
end