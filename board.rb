require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { [] } }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].empty?
      raise "no piece there!!"
    elsif !self[end_pos].empty?#valid_move?(end_pos) == false
      raise "invalid move"
    end

    # if @grid[end_pos].empty?
    #   @grid[start_pos], @grid[end_pos] = @grid[end_pos], @grid[start_pos]
    # else
    self[end_pos] = self[start_pos]
    self[start_pos] = []


  end

end
