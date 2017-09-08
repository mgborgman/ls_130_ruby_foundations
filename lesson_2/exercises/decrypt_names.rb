def decrypt_names(name)
  cipher = {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r', 'f' => 's', 'g' => 't',
            'h' => 'u', 'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y', 'm' => 'z'}
  result = []
  name.downcase.chars do |letter|
    if cipher.has_key?(letter)
      letter = cipher[letter]
    elsif cipher.has_value?(letter)
      letter = cipher.select {|_,v| v == letter}.keys.join('')
    end
    result << letter
  end
  result.join('').capitalize
end

def decrypt_names2(name)
  result = []
  name.chars do |letter|
    case letter
    when 'A'..'M', 'a'..'m'
      result << (letter.ord + 13).chr
    when 'N'..'Z', 'n'..'z'
      result << (letter.ord - 13).chr
    else
      result << letter
    end
  end
  result.join('')
end



File.open("names.txt").each do |name|
  puts decrypt_names2(name)
end