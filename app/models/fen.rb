class Fen
# Ref.: https://en.wikipedia.org/wiki/Forsyth%E2%80%93Edwards_Notation
#       https://www.chess.com/terms/fen-chess


  START_POSITION = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

  attr_reader :fen_record, :piece_placement, :active_color, :castling_availability, :en_passant_target, :halfmove_clock, :fullmove_number

  alias :to_s :fen_record

  def initialize(fen_record = nil)
    @fen_record = fen_record || START_POSITION
    @piece_placement, @active_color, @castling_availability, @en_passant_target, @halfmove_clock, @fullmove_number = @fen_record.split(' ')
    @piece_placement = @piece_placement.split('/').map! { |rank| rank.split('') }
  end

end
