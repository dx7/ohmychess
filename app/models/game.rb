require_relative '../../config/application'

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    @display.render
  end

end
