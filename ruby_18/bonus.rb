
numbers = [24, 13, 8, 65]
p numbers.any? { |n| n > 20 }
p numbers.select { |n| n > 20 }.first
p numbers.select { |n| n > 20 }.last
p numbers.select { |n| n <= 20 }.first
p numbers.select { |n| n <= 20 }.last
p numbers.map { |n| n * 2 }
p numbers