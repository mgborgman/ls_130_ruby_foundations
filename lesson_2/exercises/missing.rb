def missing(array)
  result = []
  (array.first).upto(array.last) do |current_num|
    next if array.include?(current_num)
    result << current_num
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []