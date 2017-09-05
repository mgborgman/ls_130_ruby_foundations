def select(array)
  counter = 0
  result = []
  while counter < array.size
    if yield(array[counter])
      result << array[counter]
    end
    counter += 1
  end
  result
end

p select([1, 2, 3, 4, 5]){|x| x.odd? }