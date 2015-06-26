numbers = [24, 13, 8, 65]
p numbers.select { |n| n > 20 }
p numbers.reject { |n| n > 20 }
p numbers.sort
p numbers.sort.reverse
p numbers.reduce(:+)
evens, odds = numbers.partition { |n| n.even? }
p evens
p odds