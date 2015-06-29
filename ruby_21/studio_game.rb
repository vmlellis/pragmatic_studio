require_relative "game"
require_relative "berserk_player"

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

berserk = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserk)

loop do
  puts "How many rounds? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    knuckleheads.save_high_scores
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
