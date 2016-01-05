# 4 digitos
require 'pry'
class Fixnum
  ROMAN = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
  VERSION = 1

  def to_roman
    number_array = get_number_array

    case number_array_size
      when 4
        thousands(number_array[0].to_i) + hundreds(number_array[1].to_i) + tens(number_array[2].to_i) + units(number_array[3].to_i)
      when 3
        hundreds(number_array[0].to_i) + tens(number_array[1].to_i) + units(number_array[2].to_i)
      when 2
        tens(number_array[0].to_i) + units(number_array[1].to_i)
      when 1
        units(number_array[0].to_i)
    end
  end

  def thousands(number)
    'M' * number if number < 4
  end

  def hundreds(number)
    sym1 = 'C'
    sym2 = 'D'
    sym3 = 'M'
    get_string(number, sym1, sym2, sym3)
  end

  def tens(number)
    sym1 = 'X'
    sym2 = 'L'
    sym3 = 'C'
    get_string(number, sym1, sym2, sym3)
  end

  def units(number)
    sym1 = 'I'
    sym2 = 'V'
    sym3 = 'X'
    get_string(number, sym1, sym2, sym3)
  end

  def is_4?(number)
    number % 10 == 4
  end

  def is_9?(number)
    number % 10 == 9
  end

  def bigger_than_five?(number)
    number > 5
  end

  def is_5?(number)
    number == 5
  end

  def number_array_size
    self.to_s.chars.size
  end

  def get_string(number, sym1, sym2, sym3)
    if is_4?(number)
      sym1 + sym2
    elsif is_9?(number)
      sym1 + sym3
    elsif is_5?(number)
      sym2
    elsif bigger_than_five?(number)
      sym2 + (sym1 * (number - 5))
    else
      sym1 * number
    end
  end

  def get_number_array
    self.to_s.chars
  end
end

