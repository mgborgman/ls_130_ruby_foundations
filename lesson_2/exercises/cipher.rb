require 'pry'

def cipher(names)
  result = []
  names.chars do |letter|
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

File.open("names.txt") do |file|
  puts cipher(file)
end
