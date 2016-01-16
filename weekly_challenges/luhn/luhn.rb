# class luhn
class Luhn
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def addends(new_number = true)
    reversed = new_number

    number_array_reversed.each_with_object([]) do |i, a|
      a << (reversed ? i.to_i : calculate_double(i.to_i))
      reversed = !reversed
    end.reverse
  end

  def calculate_double(n)
    n < 5 ? n * 2 : (n * 2) - 9
  end

  def checksum(new_number = true)
    addends(new_number).inject(0) { |a, e| a + e }
  end

  def valid?
    checksum % 10 == 0
  end

  def number_array_reversed
    number.to_s.reverse.chars
  end

  def self.create(number)
    luhn = Luhn.new(number)
    checksum = luhn.checksum(false)
    create_valid_number(luhn.number, checksum)
  end

  def self.checksum_number(num)
    num == 10 ? 0 : 10 - (num % 10)
  end

  def self.create_valid_number(num, checksum)
    (num.to_s << checksum_number(checksum).to_s).to_i
  end
end
