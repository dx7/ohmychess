class Display

  def initialize(game_session, theme)
    @board = game_session.board
    @theme = theme
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      row.map.with_index do |_, j|
        colorize(@board.at(i, j), colors_for(i, j))
      end
    end
  end

  # Ref.: https://misc.flogisoft.com/bash/tip_colors_and_formatting
  def colors_for(i, j)
    piece = @board.at(i, j)

    [
      @theme.colors.pieces[piece.color],
      @theme.colors.board[Board.square_color_at(i, j)]
    ]
  end

  def render
    system("clear")

    puts
    puts "    Welcome."
    puts

    build_grid.each_with_index do |row, i|
      puts colorize("    #{8 - i} #{row.join}", @theme.colors.axes.rankes)
    end

    puts colorize("       a  b  c  d  e  f  g  h", @theme.colors.axes.files)
    puts
  end

  def colorize(s, *colors)
    [colors, s.to_s, Theme.colors.reset].flatten.join
  end
end
