require_relative '../../config/application'

class GameSession

  attr_accessor :board, :active_color, :castling_availability, :en_passant_target, :halfmove_clock, :fullmove_number

  class << self

    def piece_from_fen_char(fen_piece_char)
      pieces = {
        p: [Pawn.new(BLACK)], n: [Knight.new(BLACK)], b: [Bishop.new(BLACK)], r: [Rook.new(BLACK)], q: [Queen.new(BLACK)], k: [King.new(BLACK)],
        P: [Pawn.new(WHITE)], N: [Knight.new(WHITE)], B: [Bishop.new(WHITE)], R: [Rook.new(WHITE)], Q: [Queen.new(WHITE)], K: [King.new(WHITE)]
      }

      pieces.default_proc = proc { |_, k| Array.new(k.to_s.to_i) }

      pieces[fen_piece_char.to_sym]
    end

  end

  # def initialize(piece_placement: nil, active_color: WHITE, castling_availability: 'KQkq', en_passant_target: '-', halfmove_clock: 0, fullmove_number: 1, theme_name: nil)
  def initialize(initial_fen = nil)
    fen = initial_fen || Fen.new
    @board = Board.new
    @active_color = fen.active_color
    @castling_availability = fen.castling_availability
    @en_passant_target = fen.en_passant_target
    @halfmove_clock = fen.halfmove_clock
    @fullmove_number = fen.fullmove_number

    set_up_board_from_fen(fen.piece_placement)
  end

  def set_up_board_from_fen(piece_placement)
    piece_placement.each_with_index do |rank, i|
      rank_with_pieces = rank.map { |char| GameSession.piece_from_fen_char(char) }
      rank_with_pieces.flatten!
      rank_with_pieces.each_index { |j| @board.grid[i][j] = rank_with_pieces[j] }
    end
  end

  def display(theme_name = nil)
    Display.new(self, Theme.new(theme_name)).render
  end

end
