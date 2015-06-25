require_relative "player"
require_relative "game_turn"

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
    puts "There are #{@players.size} players in #{@title}: "

    @players.each do |player| 
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end

    
    print_stats


  end

  def print_stats
    strong_players, winpy_players = @players.partition { |player| player.strong? }

    puts "\nKnuckleheads Statistics:"

    puts "\n#{strong_players.length} strong players:"
    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{winpy_players.length} winpy players:"
    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\nKnuckleheads High Scores:"

    @players.sort.each do |player|
      puts "#{player.name.ljust(20, '.')} #{player.score}"
    end

  end
end