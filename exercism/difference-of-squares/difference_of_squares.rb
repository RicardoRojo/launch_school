class Squares
  VERSION = 1
  
  def initialize(number)
    @number = number
  end

  def square_of_sums
    (1..@number).inject {|acum,number| acum + number} ** 2
  end

  def sum_of_squares
    (1..@number).inject {|acum,number| (number**2) + acum}
  end

  def difference
    square_of_sums - sum_of_squares
  end
end