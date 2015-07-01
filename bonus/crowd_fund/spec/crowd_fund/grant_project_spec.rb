require 'crowd_fund/grant_project'

module CrowdFund
  describe GrantProject do
    before do
      @initial_funds = 1000
      @project = GrantProject.new("grant project", 5000, @initial_funds)
    end
    
    it "can't have funds removed" do
      @project.add_funds
      @project.remove_funds
      expect(@project.funding).to eq(@initial_funds + 25)
    end
  end
end