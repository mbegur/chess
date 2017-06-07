require "colorize"
# require_relative 'board'
# require_relative "stepping_pieces"
# require_relative "sliding_pieces"

class Piece
  attr_reader :symbol, :board, :current_position

  def initialize(color, current_position, board)
    @color = color
    @current_position = current_position
    @board = board
  end

  def to_s
    symbol.to_s
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_move?(ideal_position)
    p ideal_position
    if ideal_position.all?{ |el| el.between?(0, 7) } &&  @board[ideal_position].empty?
      return true
    # elsif !@board[ideal_position].empty? && Opponent
    #   true
    end
    false
  end

end

class NullPiece < Piece
  # include Singleton
  def initialize
    @color = :none
    @symbol = ' '
    # super(color)
  end
end
