require 'pry'
class Prime
  attr_accessor :primes

  def self.nth(number_of_primes)
    raise ArgumentError if number_of_primes == 0
    primes = []
    i = 2
    while primes.size < number_of_primes
      if is_primo?(i,primes)
        primes << i
      end
      i += 1
    end
    primes.last
  end

  def is_primo?(number, primes)
    return true if primes.size == 0
    prime_number = true
    primes.each do |prime|
      prime_number = false if number % prime == 0
    end
    prime_number
  end
end