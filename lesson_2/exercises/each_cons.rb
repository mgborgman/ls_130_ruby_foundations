require 'pry'

#part 1
# def each_cons(array)
#   index1 = 0
#   index2 = 1
#   loop do
#     yield(array[index1], array[index2]) unless array.empty?
#     index1 += 1
#     index2 = (index1 + 1)
#     break if index2 >= array.size
#   end
# end

#part 2 - specify how many elements to be processed at one time
def each_cons(array, number_of_elements)
  array.each_with_index do |item, index|
    break if index + number_of_elements - 1 >= array.size
    yield(*array[index..(index + number_of_elements - 1)])
  end
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash #== { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash #== { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash #== {}
