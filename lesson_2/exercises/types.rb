def types(array)
  raptors = []
  array.each_with_index do |item, index|
    next if index <= 1
    raptors << item
  end
  raptors
end

result = types(%w(raven finch hawk eagle))
p result
