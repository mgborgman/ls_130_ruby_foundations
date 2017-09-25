def zip(array1, array2)
  result = []
  # keep track of index for array1 and array2
  index = 0

  while index < array1.size    
    # copy the element at index0 from both arrays into a new array
    result << [array1[index], array2[index]]
    # increment index
    index += 1
    # repeat
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]