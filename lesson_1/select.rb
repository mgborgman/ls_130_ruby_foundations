def select(array)
  counter = 0
  result = []
  while counter < array.size
    result << array[counter] if yield(array[counter]) if block_given?
    counter += 1
  end
  result
end

result = select([1, 2, 3, 4]) {|num| num.odd?}
p result