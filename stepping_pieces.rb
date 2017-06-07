require "colorize"
# require_relative 'board'
require_relative "piece"

module SteppingPiece

  KNIGHT_DELTA =  [ [1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1] ]
  KING_DELTA = [ [0, 1], [1, 1], [1, 0], [0, -1], [-1, 0], [-1, -1], [-1, 1], [1, -1] ]
  PAWN_DELTA = KING_DELTA + [ [0, 2], [0, -2] ]

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
end



class Knight < Piece
  include SteppingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    KNIGHT_DELTA
  end
end



class King < Piece
  include SteppingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    KING_DELTA
  end
end



class Pawn < Piece
  include SteppingPiece

  def initialize(color, current_position, board, symbol)
    @symbol = symbol
    super(color, current_position, board)
  end

  def move_dirs
    PAWN_DELTA
  end
end
