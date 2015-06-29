require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    puts "\nThere are #{@players.size} players in #{@title}: "

    @players.each do |player| 
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
    
    print_stats
  end

  def print_stats
    strong_players, winpy_players = @players.partition { |player| player.strong? }

    puts "\#{@title} Statistics:"

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.found_treasures do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{strong_players.length} strong players:"
    strong_players.each do |player|
      player.print_name_and_health
    end

    puts "\n#{winpy_players.length} winpy players:"
    strong_players.each do |player|
      player.print_name_and_health
    end

    puts "\n#{@title} High Scores:"

    @players.sort.each do |player|
      player.print_name_and_score
    end

  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
end