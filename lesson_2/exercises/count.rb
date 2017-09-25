def count(array)
  result = []
  array.each do |element|
    # yield element to block
    # add blocks return value to result array if blocks return value is true
    result << element if yield(element)
  end
  # count number of occurances of true in result array
  # return count
  result.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2