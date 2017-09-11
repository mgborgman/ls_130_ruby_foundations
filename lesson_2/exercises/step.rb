def step(start, stop, step)
  current_value = start
  loop do
    yield(current_value)
    break if current_value >= stop
    current_value += step
  end
  current_value
end

result = step(1, 10, 3){|value| puts "value = #{value}"}
p result