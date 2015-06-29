require_relative 'player'

class ClumsyPlayer < Player
  def initialize(name, health = 100, boost_factor = 1)
    super(name, health)
    @boost_factor = boost_factor
  end

  def found_treasure(treasure)
    super(Treasure.new(treasure.name, treasure.points / 2))
  end

  def w00t
    @boost_factor.times { super }
  end
end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")
  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"

  clumsy = ClumsyPlayer.new("klutz", 100, 10)
  clumsy.w00t
  puts clumsy.health
end