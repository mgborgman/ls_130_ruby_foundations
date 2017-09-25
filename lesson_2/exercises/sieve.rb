require 'pry'

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
    numbers.each do |prime|
      prime.reject! {|num| num != prime && num % prime == 0}
    end
    numbers
  end
end

sieve = Sieve.new(10)
p sieve.primes
