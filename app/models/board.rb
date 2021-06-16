class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    initial_position
  end

  def initial_position
    @grid.each_index do |i|
      @grid[0] = [Rook.new(BLACK), Knight.new(BLACK), Bishop.new(BLACK), Queen.new(BLACK), King.new(BLACK), Bishop.new(BLACK), Knight.new(BLACK), Rook.new(BLACK)]
      @grid[1] = [Pawn.new(BLACK), Pawn.new(BLACK),   Pawn.new(BLACK),   Pawn.new(BLACK),  Pawn.new(BLACK), Pawn.new(BLACK),   Pawn.new(BLACK),   Pawn.new(BLACK)]
      @grid[6] = [Pawn.new(WHITE), Pawn.new(WHITE),   Pawn.new(WHITE),   Pawn.new(WHITE),  Pawn.new(WHITE), Pawn.new(WHITE),   Pawn.new(WHITE),   Pawn.new(WHITE)]
      @grid[7] = [Rook.new(WHITE), Knight.new(WHITE), Bishop.new(WHITE), Queen.new(WHITE), King.new(WHITE), Bishop.new(WHITE), Knight.new(WHITE), Rook.new(WHITE)]
    end
  end

end
