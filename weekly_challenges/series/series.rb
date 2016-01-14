# class series
class Series
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def slices(slices_number)
    fail ArgumentError, 'Too big slice' if slices_number > number.size
    b = []
    number.chars.each_index do |idx|
      b << number.slice(idx, slices_number).chars.map(&:to_i) if idx + slices_number <= number.size
    end
    b
  end
end
