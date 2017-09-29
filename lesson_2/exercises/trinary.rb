class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number =~ /[3-9\D]/
    total = 0
    digits = @number.split('').map(&:to_i).reverse
    digits.each_with_index {|num, index| total += num * (3 ** index)}
    total
  end
end


