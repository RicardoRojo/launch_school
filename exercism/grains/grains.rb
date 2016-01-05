class Grains

  def self.square(square)
    square == 1 ? 1 : 2 * square(square - 1)
  end

  def self.total
    (1..64).inject(0) {|acum,val| acum + square(val)}
  end
end