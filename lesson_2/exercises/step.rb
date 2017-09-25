def step(starting_num, ending_num, step)
  # build a range based off starting_num and ending_num
  range = (starting_num..ending_num).to_a
  current_number = range.first
  # iterate through the range
  while current_number <= range.last
    # pass the current number to the block
    yield(current_number)
    # increase current number by step
    current_number += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
