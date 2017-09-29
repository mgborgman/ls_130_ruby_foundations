def mystery_math(string)
  string.sub(/[+*\/\-]/, '?')
end

p mystery_math('4 - 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'

def mystery_math2(string)
  string.gsub(/[+\-*\/]/, '?')
end

p mystery_math2('4 - 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

p mystery_math2('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'