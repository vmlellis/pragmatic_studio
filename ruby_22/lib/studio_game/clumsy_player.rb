require_relative 'player'

module StudioGame
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
end