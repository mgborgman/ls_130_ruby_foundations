def each_cons(array)
  index1 = 0
  index2 = 1
  # iterate over the array
  while index2 < array.size
    # pass in values at index1 = 0 and index2 = 1 to block
    yield(array[index1], array[index2])
    # increment index1 by 1 and index2 = index1 + 1
    index1 += 1
    index2 = index1 + 1
  end
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}