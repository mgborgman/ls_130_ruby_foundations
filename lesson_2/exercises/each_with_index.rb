def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index) if block_given?
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
