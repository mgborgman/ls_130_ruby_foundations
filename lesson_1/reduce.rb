def reduce(array, starting_total=0)
  counter = 0

  while counter < array.size
    starting_total = yield(starting_total, array[counter])
    counter += 1
  end
  starting_total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num if num.odd? } 