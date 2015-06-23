name1 = 'larry'
health1 = 60

puts name1 + '\'s' + ' health is ' + health1.to_s
puts "#{name1}'s health is #{health1}"
puts "#{name1}'s health is #{health1 * 3}"
puts "#{name1}'s health is #{health1 / 9.0}"
puts "#{name1}'s health is #{health1 / 9}"

puts "Players: \n\tlarry\n\tcurly\n\tmoe"

# or assign the names to variables:
name1 = 'larry'
name2 = 'curly'
name3 = 'moe'

puts "Players: \n\t#{name1}\n\t#{name2}\n\t#{name3}"
