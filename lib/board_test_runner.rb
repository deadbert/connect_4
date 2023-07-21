require_relative 'board'
require_relative 'token'

board = Board.new

board.setup_game

board.render_board
puts "-------"
puts "-------"
board.render_board_manual
