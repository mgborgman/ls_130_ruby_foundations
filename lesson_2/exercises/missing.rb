def missing(array)
  range = (array.first..array.last).to_a
  result = range.select do |num|
    !array.include?(num)
  end
  result
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []