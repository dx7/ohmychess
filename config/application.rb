$LOAD_PATH.push(File.expand_path('../app/models', __dir__))

require 'byebug'

BLACK = :black
WHITE = :white

require 'piece'
require 'king'
require 'bishop'
require 'knight'
require 'pawn'
require 'queen'
require 'rook'
require 'board'
require 'display'
require 'game'
