# Board class
class Board
  def self.transform(inp)
    board = inp
    check_errors(board)

    prepare_array!(board)
    board.each_with_index do |line, line_idx|
      line.each_with_index do |cell, cell_idx|
        next unless bomb?(cell)
        mark_cells_around_bomb(board, line_idx, cell_idx)
      end
    end
    board.map(&:join)
  end

  def self.bomb?(element)
    element == '*'
  end

  def self.mark_cells_around_bomb(board, line_idx, cell_idx)
    (-1..1).each do |i|
      (-1..1).each do |j|
        board[line_idx + i][cell_idx + j] += 1 unless
          '+-|-* '.include?(board[line_idx + i][cell_idx + j].to_s)
        board[line_idx + i][cell_idx + j] = 1 if
          board[line_idx + i][cell_idx + j] == ' '
      end
    end
  end

  def self.prepare_array!(array)
    array.map!(&:chars)
  end

  def self.check_errors(board)
    fail ValueError, 'Different row size' unless same_size_rows?(board)
    fail ValueError, 'The borders are wrong' unless faulty_border?(board)
    fail ValueError, 'invalid char' if invalid_char?(board)
  end

  def self.same_size_rows?(board)
    board.all? { |line| board.first.size == line.size }
  end

  def self.faulty_border?(board)
    board.first == board.last
  end

  def self.invalid_char?(board)
    board.any? { |line| line =~ /[a-zA-Z]/ }
  end
end

class ValueError < ArgumentError
end
