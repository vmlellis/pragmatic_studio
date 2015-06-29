require_relative 'rspec_helper'
require_relative 'player'
require_relative 'treasure_trove'

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
    @player.score.should == @player.health + @player.points
  end

  it "computes a score as the sum of its health and length of name" do
    @player.to_s.should == "I'm #{@player.name} with health = #{@player.health}, points = 0, and score = #{@player.health}."
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  it "is a strong" do
    @player.should be_strong
  end

  it "computes a score as the sum of its health and points" do 
    @player.found_treasure(Treasure.new(:hammer, 50)) 
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.score.should == 250 
  end

  it "has a string representation" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
  end

  context "with a health of 100" do
    before do
      @initial_health = 100
      @player = Player.new("larry")
    end

    it "has an initial health" do
      @player.health.should == @initial_health
    end

    it "is not a strong" do
      @player.should_not be_strong
    end
  end

  context "in a collection of players" do 
    before do
      @player1 = Player.new("moe", 100) 
      @player2 = Player.new("larry", 200) 
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3] 
    end

    it "is sorted by decreasing score" do 
      @players.sort.should == [@player3, @player2, @player1]
    end 
  end


end