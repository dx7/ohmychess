class Display

  def initialize(board)
    @board = board
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color = colors_for(i, j)

      if piece.nil?
        colorize("   ", fg: color[:fg], bg: color[:bg])
      else
        colorize(piece.to_s, fg: color[:fg], bg: color[:bg])
      end
    end
  end

  # Ref.: https://misc.flogisoft.com/bash/tip_colors_and_formatting
  def colors_for(i, j)
    color = {}
    piece = @board.grid[i][j]

    if (i + j).odd?
      color[:bg] = :black
    else
      color[:bg] = :dark_gray
    end

    if piece
      color[:fg] = piece.white? ? :white : :light_yellow
    end

    color
  end

  def render
    system("clear")

    puts
    puts "    Welcome."
    puts

    build_grid.each_with_index { |row, idx| puts colorize("    #{8 - idx}", fg: :dark_gray) << " #{row.join}" }
    puts colorize("       a  b  c  d  e  f  g  h", fg: :dark_gray)
    puts
  end

  def colorize(s, fg: :default, bg: :default)
    colors = {
      fg:  { default: "\033[39m", light_yellow: "\033[93m", white: "\033[97m", dark_gray: "\033[90m" },
      bg:  { default: "\033[49m", black: "\033[40m", dark_gray: "\033[100m" }
    }

    [colors[:bg][bg], colors[:fg][fg], s, "\033[0m"].join
  end
end
