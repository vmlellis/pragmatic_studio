# 1. Play With an Array

books = ["Blink", "Freakonomics", "Outliers"]

p books.size
p books[1]
p books[3]

arr = []
books.each do |book|
	arr.push(book)
end

p books
p arr

while !books.empty? do
	books.pop
end

p books

p arr.join(" and ")

p arr.shuffle


# 2. Create a Array of Players and Iterate