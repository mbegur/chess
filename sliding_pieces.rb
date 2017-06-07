require "colorize"
# require_relative 'board'
require_relative 'piece'

module SlidingPiece

  DIAGONAL_DELTAS = [ [1, 1], [-1, -1], [-1, 1], [1, -1] ]
  VERTICAL_DELTAS = [ [0, 1], [0, -1] ]
  HORIZONTAL_DELTAS = [ [1, 0], [-1, 0] ]

  def moves
    all_possible_moves = []
    move_dirs.each do |delta|
      all_possible_moves.concat(moves_in_dir(delta))
    end
    all_possible_moves
  end

  private

  def moves_in_dir(delta)
    moves = []
    current_pos = @current_position
    p move = [@current_position[0] + delta[0], @current_position[1] + delta[1]]
    p valid_move?(move)
    while valid_move?(move)
      moves << move
      move = [move[0] + delta[0], move[1] + delta[1]]
    end
    p moves # ALL truthy/valid possible moves
  end
  # def move_dirs
  #   if self.class? == Bishop
  #     DIAGONAL_DELTAS
  #   elsif self.class? == Rook
  #     VERTICAL_DELTAS + HORIZONTAL_DELTAS
  #   elsif self.class? == Queen
  #     VERTICAL_DELTAS + HORIZONTAL_DELTAS + DIAGONAL_DELTAS
  #   end
  # end

end

class Queen < Piece
  include SlidingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + DIAGONAL_DELTAS
  end

end

class Bishop < Piece
  include SlidingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    DIAGONAL_DELTAS
  end

end

class Rook < Piece
  include SlidingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    VERTICAL_DELTAS + HORIZONTAL_DELTAS
  end
end
