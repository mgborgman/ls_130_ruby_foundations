def zip(array1, array2)
  result = []
  index = 0
  loop do
    result << [array1[index], array2[index]]
    index += 1
    break if index >= array1.size
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]