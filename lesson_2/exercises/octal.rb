class Octal
  def initialize(number)
    @digits = number
  end

  def to_decimal
    return 0 if @digits =~ /[8-9\D]/
    octal = 0
    @digits.split('').map(&:to_i).reverse.each_with_index do |num, index|
      octal += num * 8 ** index
    end
    octal
  end
end