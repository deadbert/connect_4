require_relative 'board'
require_relative 'token'
require_relative 'player'
require_relative 'turn_manager'

board = Board.new
board.setup_game

on = true
puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit"
choice = gets.chomp

if choice.downcase == "p"
  puts "would you like X's or O's?('x/o')"
  selection = gets.chomp
  player_1 = Player.new(selection)
end

game = TurnManager.new(board, player_1)
while on
  game.start_turn
  # test for win conditions
  # game.cpu_turn goes here
  # test for win conditions
  # test for draw
end



# while on
#   board.render_board
#   puts "Select a column for your piece(A-G)"
#   column = gets.chomp.upcase.intern
#   new_token = player_1.place_piece(column, board)
#   if new_token == "invalid column, column full" || new_token == "invalid column"
#     until new_token != "invalid column, column full" && new_token != "invalid column"
#       puts "#{new_token}"
#       puts "Select another row(A-G)"
#       column = gets.chomp.upcase.intern
#       new_token = player_1.place_piece(column, board)
#     end
#   end
#   # check win conditions
#   # on = false if board.draw?
# end
