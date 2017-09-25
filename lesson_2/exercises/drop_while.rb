require 'pry'

def drop_while(array)
  result = []
  index = 0
  array_copy = array.dup
  # iterate over array
  while index < array_copy.size
    # yield element to block
    block_result = yield(array_copy[index])
    # check whether block result is true or false
    if block_result
      # if true move to next iteration
      index += 1
    else
      # if false store current element and all remaining elements of array in result array
      result << array[index..-1]
      break
    end
  end
  # return result array
  result.flatten
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } #== []
p drop_while([1, 3, 5, 6]) { |value| false } #== [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } #== [5, 6]
p drop_while([]) { |value| true } #== []