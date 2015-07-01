require 'crowd_fund/project'

module CrowdFund
  describe Project do
    before do
      @name = "my project"
      @funding = 1500
      @target = 3000
      @project = Project.new(@name, @target, @funding)
      $stdout = StringIO.new # Suppress puts
    end

    it "has a upcased name" do
      expect(@project.name).to eq(@name.upcase)
    end

    it "has an initial target funding amount" do
      expect(@project.target).to eq(@target)
    end

    it "has a target funding amount" do
      expect(@project.target).to eq(@target)
    end

    it "computes outstanding funding as target minus funding" do
      expect(@project.remaining_funding).to eq(@target - @funding)
    end

    it "increases funds default by 25 when funds are added" do
      @project.add_funds
      expect(@project.funding).to eq(@funding + 25)
    end

    it "increases funds by 10 when funds are added" do
      @project.add_funds(10)
      expect(@project.funding).to eq(@funding + 10)
    end

    it "desceases funds default by 15 when funds are removed" do
      @project.remove_funds
      expect(@project.funding).to eq(@funding - 15)
    end

    it "desceases funds by 10 when funds are removed" do
      @project.remove_funds(10)
      expect(@project.funding).to eq(@funding - 10)
    end

    context "with default funding" do
      before do
        @project = Project.new("abc", 3000)
      end

      it "has a default value of 0 for funding amount" do
        expect(@project.funding).to eq(0)
      end
    end

    context "in which funding equals or exceeds the target" do
      before do
        funding = target = 1000
        @project = Project.new("abc", target, funding)
      end

      it "is fully funded" do
        expect(@project).to be_fully_funded
      end
    end

    context "in which funding is less than the target" do
      before do
        funding = 500
        target = 1000
        @project = Project.new("abc", target, funding)
      end

      it "is under funded" do
        expect(@project).not_to be_fully_funded
      end
    end
  
    it "computes pledges as the sum of all pledges" do
      expect(@project.total_pledges).to be_zero

      @project.received_pledge(Pledge.new(:silver, 75))

      expect(@project.total_pledges).to eq(75)
      
      @project.received_pledge(Pledge.new(:bronze, 50))

      expect(@project.total_pledges).to eq(125)
      
      @project.received_pledge(Pledge.new(:gold, 100))

      expect(@project.total_pledges).to eq(225)
    end

    it "computes total funds as the sum of a projects funding and pledges" do
      @project.received_pledge(Pledge.new(:gold, 100))
      @project.received_pledge(Pledge.new(:gold, 100))
      
      expect(@project.total_funding).to eq(1700)
    end

    it "yields each received pledge and its total pledge amount" do
      @project.received_pledge(Pledge.new(:bronze, 50))
      @project.received_pledge(Pledge.new(:silver, 75))
      @project.received_pledge(Pledge.new(:silver, 75))
      @project.received_pledge(Pledge.new(:gold, 100))
      @project.received_pledge(Pledge.new(:gold, 100))
      @project.received_pledge(Pledge.new(:gold, 100))
      
      yielded = []
      @project.each_received_pledge do |pledge|
        yielded << pledge
      end
      
      expect(yielded).to eq([
        Pledge.new(:bronze, 50), 
        Pledge.new(:silver, 150), 
        Pledge.new(:gold, 300)
     ])
    end
  end
end