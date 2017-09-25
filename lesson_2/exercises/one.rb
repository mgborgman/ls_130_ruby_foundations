require 'pry'

def one?(array)
  return false if array.empty?
  result = []
  array.each do |element|
    # check if block is true or false
    block_result = yield(element)
    # if false move to next iteration
    next unless block_result
    result << block_result
    # if true, check if block has returned true before
    # if this is the first time - move to next iteration
    next if result.size == 1
    # if this is the second time - return false
    return false
  end
  return true if result.size == 1
  # return false if code makes it to this point
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false