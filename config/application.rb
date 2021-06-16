$LOAD_PATH.push(File.expand_path('../app/models', __dir__))
$LOAD_PATH.push(File.expand_path('../lib', __dir__))

# ruby stdlib
require 'yaml'

# local
require 'stdlib_ext/ostruct'

BLACK = :black
WHITE = :white
BLANK = :blank

require 'unoccupied_square'
require 'piece'
require 'king'
require 'bishop'
require 'knight'
require 'pawn'
require 'queen'
require 'rook'
require 'board'
require 'theme'
require 'display'
require 'game'

module App
  class << self

    def root
      File.expand_path('..', __dir__)
    end

    def read_file(filename)
      File.read(File.join(root, filename))
    end

  end
end
