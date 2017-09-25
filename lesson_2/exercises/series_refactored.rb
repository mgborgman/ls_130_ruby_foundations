class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    result = []
    index = 0

    validate_argument(length)

    while (index + length) <= @digits.size
      result << @digits[index..(index + length - 1)].split('').collect(&:to_i)
      index += 1
    end
    result
  end

  def validate_argument(length)
    raise ArgumentError unless length <= @digits.size
  end
end

series = Series.new('12345')
p series.slices(3)