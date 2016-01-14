# class queens
class Queens
  attr_reader :white, :black

  def initialize(args = {})
    @white = args[:white] || [0, 3]
    @black = args[:black] || [7, 3]
    fail ArgumentError, 'Invalid positions' if invalid_initial_positions?
  end

  def invalid_initial_positions?
    white == black
  end

  def attack?
    same_row_or_column? || diagonal?
  end

  def same_row_or_column?
    white.first == black.first || white.last == black.last
  end

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

  def to_s
    paint_board
  end

  def paint_board
    cells = Array.new(8) { Array.new(8) }

    (0..7).each do |row|
      (0..7).each do |column|
        if [row, column] == white
          cells[row][column] = 'W'
        elsif [row, column] == black
          cells[row][column] = 'B'
        else
          cells[row][column] = '_'
        end
      end
    end
    cells.map { |row| row.join(' ') }.join("\n")
  end
end
