# name has to match the following regex NAME_REGEXP = /^[A-Z]{2}\d{3}$/
# the regular expression needs the name to start with to random uppercase letters followed by 3 random digits
class Robot
  attr_accessor :name 
  LETTERS_ARRAY = ('A'..'Z').to_a
  NUMBERS_TO_ARRAY = (0..9).to_a

  def initialize
    @name = set_name
  end

  def set_name
    get_letters_for_name(2) + get_numbers_for_name(3)
  end

  def get_letters_for_name(total_letters)
    i = 0
    name = ""
    while i < total_letters
      name += LETTERS_ARRAY.sample
      i += 1
    end
    name
  end

  def get_numbers_for_name(total_numbers)
    i = 0
    name = ""
    while i < total_numbers
      name += (NUMBERS_TO_ARRAY.sample).to_s 
      i += 1
    end
    name
  end

  def reset
    self.name = set_name
  end
end