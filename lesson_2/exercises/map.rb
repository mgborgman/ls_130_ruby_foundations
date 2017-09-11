def map(array)
  result = []
  array.each { |item| result << yield(item) if block_given? }
  result
end


p map({1 => 'a', 3 => 'b', 6 => 'c'}) { |key,_| key + 1 } == [2, 4, 7]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]