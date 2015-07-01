class Player
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    @health -= 10
    "I'm  #{@name} with a health of #{@health}."
  end

  def blam
    @health -= 10
    p "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    p "#{@name} got w00ted!"
  end
end

player1 = Player.new("moe")
puts player1

player2 = Player.new("larry", 60) 
puts player2

player3 = Player.new("curly", 125) 
puts player3
player3.blam
puts player3
player3.w00t 
puts player3


# Answers:
# 1. A class is a factory (blueprint) that instantiates (objects/methods).
# 2. Objects have unique (state) and a commom set of (behaviors).
# 3. An (instance) variable exists for the cycle of an (object).
# 4. (Instance) methods have access to their object's (instance) variables.
# 5. Class names start with an (uppercase) letter.
#    Method names start with a (lowercase) letter.
#    Variable names start with a (lowercase) letter.
#    Instances variables start with an (@ sign).

