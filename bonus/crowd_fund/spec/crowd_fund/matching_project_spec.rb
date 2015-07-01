require 'crowd_fund/matching_project'

module CrowdFund
  describe MatchingProject do
    before do
      @initial_funds = 0
      @project = MatchingProject.new("Matching Project", 150, @initial_funds)
    end
    
    it "does not match additional funds when the project is not halfway funded" do
      2.times { @project.add_funds }
       
      expect(@project.half_funded?).to be_falsey
    end
    
    it "is half funded when it has received half of its target funding amount" do
      3.times { @project.add_funds }
       
      expect(@project.half_funded?).to be_truthy
    end
    
    it "receives twice as much added funds when it is halfway funded" do
      4.times { @project.add_funds }
      
      expect(@project.funding).to eq(@initial_funds + (2 * 25) + 2*(2 * 25))
    end  
  end
end
  