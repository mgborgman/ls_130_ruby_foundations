def url?(string)
  return true if string =~ /\Ahttps?:\/\/\S+\z/
  false
end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false