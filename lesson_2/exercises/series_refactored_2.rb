class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    result = []
    index = 0

    validate_argument(length)

    while (index + length) <= @digits.size
      result << @digits.slice(index, length).split('').collect(&:to_i)
      index += 1
    end
    result
  end

  def validate_argument(length)
    raise ArgumentError unless length <= @digits.size
  end
end