require_relative "player"
require_relative "die"

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play
    @players.each do |player|
      die = Die.new

      player.blam if [1,2].include?(die.number)
      player.skip if [3,4].include?(die.number)
      player.w00t if [5,6].include?(die.number)
    end

  end
end