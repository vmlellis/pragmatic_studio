require 'csv'
require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

module StudioGame
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
        if block_given?
          break if yield
        end
      end
    end

    def print_stats
      strong_players, winpy_players = @players.partition { |player| player.strong? }

      puts "\n#{@title} Statistics:"

      puts "\n#{strong_players.length} strong players:"
      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{winpy_players.length} winpy players:"
      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{@title} High Scores:"

      @players.sort.each do |player|
        puts high_score_entry(player)
      end

      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end

      puts "\n#{total_points} total points from treasures found"

    end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end

    def load_players(from_file)
      # File.readlines(from_file).each do |line|
      #   add_player(Player.from_csv(line))
      # end
      # CSV.foreach(from_file) do |row|
      #   name, health = row
      #   add_player(Player.new(name, Integer(health)))
      # end
      CSV.foreach(from_file) do |row|
        add_player(Player.from_csv(row))
      end
    end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def high_score_entry(player)
      "#{player.name.ljust(20, '.')} #{player.score}"
    end

    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end
  end
end