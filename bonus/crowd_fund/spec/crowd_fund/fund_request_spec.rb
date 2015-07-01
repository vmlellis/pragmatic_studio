require 'crowd_fund/fund_request'

module CrowdFund
  describe FundRequest do
    before do
      @fund_request = FundRequest.new("Startup Projects")

      @initial_funding = 250
      @project = Project.new("Dito", 2000, @initial_funding)

      @fund_request.add_project(@project)

      @funding_rounds = 2

      $stdout = StringIO.new
    end

    it "adds funds to a project if an even number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(2)

      @fund_request.request_funding(@funding_rounds)

      expect(@project.funding).to eq(@initial_funding + (25 * @funding_rounds))
    end

    it "removes funds to a project if an odd number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)

      @fund_request.request_funding(@funding_rounds)
      
      expect(@project.funding).to eq(@initial_funding - (15 * @funding_rounds))
    end

    it "assigns a pledge for amount during a project's funding round" do     
      @fund_request.request_funding(1)

      expect(@project.total_pledges).not_to be_zero
    end

  end
end