require_relative '../../config/application'

class Game

  def initialize(theme_name: nil)
    @board = Board.new
    @theme = Theme.new(theme_name)
    @display = Display.new(@board, @theme)
  end

  def play
    @display.render
  end

end
