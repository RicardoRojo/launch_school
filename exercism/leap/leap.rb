class Year
  VERSION = 1

  def self.leap?(year)
    (evenly_divisible_by_4?(year) && !evenly_divisible_by_100?(year)) || 
      evenly_divisible_by_4?(year) && evenly_divisible_by_100?(year) && evenly_divisible_by_400?(year) ? true : false
  end

  def self.evenly_divisible_by_4?(year)
    year % 4 == 0
  end

  def self.evenly_divisible_by_100?(year)
    year % 100 == 0
  end

  def self.evenly_divisible_by_400?(year)
    year % 400 == 0
  end
end