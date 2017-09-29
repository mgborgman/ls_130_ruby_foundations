class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    series = []
    result = []
    index1 = 0
    index2 = 0

    validate_argument(length)

    while (index1 + length) <= @digits.size
      length.times do
        series << @digits[index2].to_i
        index2 += 1
      end
      result << series
      index1 += 1
      series = []
      index2 = index1
    end
    result
  end

  def validate_argument(length)
    raise ArgumentError unless length <= @digits.size
  end
end


series = Series.new('12345')
p series.slices(3)