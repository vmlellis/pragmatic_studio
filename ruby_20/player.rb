require_relative "treasure_trove"

class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def score
    @health + points
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def strong?
    @health > 100
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      treasure = Treasure.new(name, points) 
      yield treasure
    end
  end

  # def self.from_csv(line)
  #   name, health = line.split(',')
  #   Player.new(name, Integer(health))
  # end

  def self.from_csv(row)
    name, health = row
    Player.new(name, Integer(health))
  end

  def <=>(other_player)
    other_player.score <=> score
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  puts player.w00t
  puts player.health
  puts player.blam
  puts player.health
  player.found_treasure(Treasure.new(:hammer, 50))
  player.found_treasure(Treasure.new(:hammer, 50))
  puts player.points
  puts player.score
end