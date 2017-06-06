
class Piece
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end


end

class NullPiece < Piece

  def initialize(symbol)
    @symbol = ' '
  end


end

class Queen
end

class Bishop

end

class Rook
end

module SlidingPiece

end



module SteppingPiece

end
