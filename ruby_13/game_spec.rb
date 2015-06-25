require_relative 'rspec_helper'
require_relative 'game' 

describe Game do
  
  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end

  it "roll a high number" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play
    @player.health.should == @initial_health + 15
  end

  it "roll a medium number" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.health.should == @initial_health
  end

  it "roll a low number" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play
    @player.health.should == @initial_health - 10
  end

end