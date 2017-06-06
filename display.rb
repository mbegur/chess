require "colorize"
require_relative "cursor"
class Display
 attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    # @board.grid.map do |row|
    #   puts row.join("|")
    # end
    system('clear')
    @board.grid.each_index do |row|
      puts
      @board.grid[row].each_index do |col|
        if [row, col] == @cursor.cursor_pos
          print @board[[row, col]].colorize(background: :light_green)
        else
          print @board[[row, col]].colorize(background: :light_cyan)
        end
      end
    end
  end

  def test_cursor
    50.times do
      render
      p @cursor.get_input
    end
  end

end
