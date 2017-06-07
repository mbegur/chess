require_relative 'stepping_pieces'
require_relative 'sliding_pieces'
require_relative 'cursor'

class Board
  attr_reader :grid


  def initialize

    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    @grid[1] = [Pawn.new(:black, [1,0], self, :P),
    Pawn.new(:black, [1,1], self, :P),
    Pawn.new(:black, [1,2], self, :P),
    Pawn.new(:black, [1,3], self, :P),
    Pawn.new(:black, [1,4], self, :P),
    Pawn.new(:black, [1,5], self, :P),
    Pawn.new(:black, [1,6], self, :P),
    Pawn.new(:black, [1,7], self, :P)]

    @grid[0] = [Rook.new(:black, [0,0], self, :R), Knight.new(:black, [0,1], self, :K), Bishop.new(:black, [0,2], self, :B), Queen.new(:black, [0,3], self, :Q),
    King.new(:black, [0,4], self, :K), Bishop.new(:black, [0,5], self, :B), Knight.new(:black, [0,6], self, :K), Rook.new(:black, [0,7], self, :R)]
    @grid[6] = [Pawn.new(:light_red, [6,0], self, :P),
    Pawn.new(:light_red, [6,1], self, :P),
    Pawn.new(:light_red, [6,2], self, :P),
    Pawn.new(:light_red, [6,3], self, :P),
    Pawn.new(:light_red, [6,4], self, :P),
    Pawn.new(:light_red, [6,5], self, :P),
    Pawn.new(:light_red, [6,6], self, :P),
    Pawn.new(:light_red, [6,7], self, :P)]
    @grid[7] = [Rook.new(:light_red, [7,0], self, :R), Knight.new(:light_red, [7,1], self, :K), Bishop.new(:light_red, [7,2], self, :B), King.new(:light_red, [7,3], self, :K),
    Queen.new(:light_red, [7,4], self, :Q), Bishop.new(:light_red, [7,5], self, :B), Knight.new(:light_red, [7,6], self, :K), Rook.new(:light_red, [7,7], self, :R)]

  end



    #
    #
    # ROW_ZERO = [Rook.new(:black, [0,0], Board.new, :R), Knight.new(:black, [0,1], Board.new, :K), Bishop.new(:black, [0,2], Board.new, :B), Queen.new(:black, [0,3], Board.new, :Q),
    # King.new(:black, [0,4], Board.new, :K), Bishop.new(:black, [0,5], Board.new, :B), Knight.new(:black, [0,6], Board.new, :K), Rook.new(:black, [0,7], Board.new, :R)]
    #
    # ROW_SEVEN = [Rook.new(:light_red, [7,0], Board.new, :R), Knight.new(:light_red, [7,1], Board.new, :K), Bishop.new(:light_red, [7,2], Board.new, :B), King.new(:light_red, [7,3], Board.new, :K),
    # Queen.new(:light_red, [7,4], Board.new, :Q), Bishop.new(:light_red, [7,5], Board.new, :B), Knight.new(:light_red, [7,6], Board.new, :K), Rook.new(:light_red, [7,7], Board.new, :R)]


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
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def in_bounds?(pos)
    return false unless (0...8).include?(pos[0]) && (0...8).include?(pos[1])
    true
  end

  def in_check?(color)

  end
end
