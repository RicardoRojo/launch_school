class Octal
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if invalid_octal?
    power = -1
    number.chars.reverse.inject(0) do |a,e|
      power += 1
      a + (e.to_i * (8 ** power))
    end.to_i
  end

  def invalid_octal?
    !number.scan(/[89a-z]/).empty?
  end
end