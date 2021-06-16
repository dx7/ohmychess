class Piece

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def white?
    @color == WHITE
  end

  def black?
    !white?
  end

end
