require_relative 'player'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
  end

  it "has a capitalized name" do
    @player.name.should == "Larry"
  end

  it "has an initial health" do
    @player.health.should == @initial_health
  end

  it "has a score method" do
    @player.score.should == @player.health + @player.name.length
  end

  it "computes a score as the sum of its health and length of name" do
    @player.to_s.should == "I'm #{@player.name} with a health of #{@player.health} and score of #{@player.health + @player.name.length}"
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end


end