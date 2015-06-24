# Player Class
class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
  	@name = name.capitalize
  	@health = health
  end

  def score
  	@name.length + @health
  end

  def blam
    @health -= 10
    p "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    p "#{@name} got w00ted!"
  end

  def to_s
  	"I'm  #{@name} with a health of #{@health} and score of #{score}"
  end
end


# Game class
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
		puts "There are #{@players.size} players in #{@title}"
		puts @players
		@players.each do |player|
			player.blam
			player.w00t
			player.w00t
			puts player
		end
	end
end

# Initialize game
knuckleheads = Game.new("Knuckleheads")
puts knuckleheads.title

# Adding players
player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

knuckleheads.play
