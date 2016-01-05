# Write a program that will calculate the date that someone turned or will celebrate their 1 Gs anniversary.

# A gigasecond is one billion (10**9) seconds.
class Gigasecond
  GIGASECOND = 10**9
  VERSION = 1
  def self.from(date)
    date + GIGASECOND
  end
end