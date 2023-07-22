require_relative 'board'
require_relative 'token'
require_relative 'player'
require_relative 'turn_manager'
require_relative 'computer_random'

board = Board.new
board.setup_game

cpu = ComputerRandom.new

on = true
puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit"
choice = gets.chomp

if choice.downcase == "p"
  puts "would you like X's or O's?('x/o')"
  selection = gets.chomp
  player_1 = Player.new(selection)
else
  on = false
end

game = TurnManager.new(board, player_1, cpu)
while on
  game.start_turn
  # test for win conditions
  game.cpu_turn
  # test for win conditions
  if board.draw?
    puts "It's a draw"
    board.render_board
    break
  end
end
