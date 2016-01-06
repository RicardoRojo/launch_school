# http://www.exercism.io/exercises/ruby/raindrops/readme

class Raindrops
  VERSION = 1
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
  PRIMES = [2, 3, 5, 7]

  def self.convert(number)
    raindrop = ''
    dividend = number
    i = 0
    divisor = PRIMES[i]
    loop do
      if self.multiple?(dividend, divisor)
        add_sound_to_raindrop!(raindrop, divisor)
        return raindrop if self.prime?(dividend, divisor)
        dividend /= divisor
      else
        i += 1
        return number.to_s if PRIMES.size <= i
        divisor = PRIMES[i]
      end
    end
  end

  def self.add_sound_to_raindrop!(raindrop, divisor)
    raindrop << SOUNDS[divisor] if divisor != 2 && !raindrop.include?(SOUNDS[divisor])
  end

  def self.multiple?(dividend, divisor)
    dividend % divisor == 0
  end

  def self.prime?(dividend, divisor)
    dividend / divisor == 1
  end
end
