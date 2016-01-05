class Raindrops
  VERSION = 1
  SOUNDS = {3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}
  PRIMES = [2,3,5,7]

  def self.convert(number)
    working_number = number
    raindrop = ''
    i = 0
    divisor = PRIMES[i]
    
    loop do
      if self.prime?(working_number,divisor)
        if self.divisor_is_one?(working_number,divisor)
          if divisor != 2
            raindrop += SOUNDS[divisor] if !raindrop.include?(SOUNDS[divisor])
          end
          return raindrop
        else
          raindrop += SOUNDS[divisor] if divisor != 2 && !raindrop.include?(SOUNDS[divisor])
          working_number = working_number / divisor
        end
      else
        if i + 1 < PRIMES.size
          i += 1
          divisor = PRIMES[i]
        else
          return number.to_s
        end
      end
    end
  end

  def self.calculate_primes(number)
    
  end

  def self.prime?(number,divisor)
    number % divisor == 0
  end

  def self.divisor_is_one?(number,divisor)
    number / divisor == 1
  end
end

