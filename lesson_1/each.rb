def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end


each([1,2,3]) do |num|
  num += 1
  puts num
end