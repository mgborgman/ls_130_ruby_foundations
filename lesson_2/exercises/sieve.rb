class Sieve
  def initialize(limit)
    @range = (2..limit).to_a
  end

  def primes
    @range.each_with_index do |_, index|
      current_number = @range[index]
      @range.delete_if {|number| number % current_number == 0 && number != current_number}
      break if current_number == @range.last
    end
    @range
  end
end

