require "colorize"
require_relative "cursor"
class Display
 attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.grid.map do |row|
      puts row.join("|")

    end

  end

  def test_cursor
    5.times do
      render
      p @cursor.get_input
    end
  end

end
