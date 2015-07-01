# 1. Play With an Array

books = ["Blink", "Freakonomics", "Outliers"]

puts books.size
puts books[1]
puts books[3]

arr = []
books.each do |book|
  arr.push(book)
end

p books
p arr

while !books.empty? do
  books.pop
end

puts books

puts arr.join(" and ")

puts arr.shuffle

puts

# 2. Create a Array of Players and Iterate
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

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

players = [player1, player2, player3]

puts "There are #{players.size} in the game"

players.each do |player|
  puts player
end

puts

# 3. Create More Blocks
players.each do |p|
  puts p.health
end

puts 

players.each do |p|
  p.blam
  p.w00t
  p.w00t
  puts p
end

players.pop
players.push(Player.new("Shemp", 90))

puts

players.each do |p|
  p.blam
  p.w00t
  p.w00t
  puts p
end
