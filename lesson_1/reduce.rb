def reduce(array, default=0)
  counter = 0
  accumulator = default
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end

total = reduce([1, 2, 3, 4, 5]){|num, acc| acc + num}
p total