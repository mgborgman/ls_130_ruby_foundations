def divisors(num)
  result = []
  result2 = []
  1.upto(Math.sqrt(num)) do |current_num|
    result << current_num if num % current_num == 0
  end
  result.each do |current_num|
    result2 << (num / current_num)
  end
  (result + result2).uniq
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute