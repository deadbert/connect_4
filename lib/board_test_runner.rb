require_relative 'board'
require_relative 'token'
require_relative 'player'
require_relative 'turn_manager'
require_relative 'computer_random'
require_relative 'power_button'

board = Board.new
cpu = ComputerRandom.new

def main_menu(board, cpu)
  puts "Welcome to CONNECT FOUR"
  puts "Enter p to play. Enter q to quit"
  choice = gets.chomp

  if choice.downcase == "p"
    puts "would you like X's or O's?('x/o')"
    selection = gets.chomp
    player_1 = Player.new(selection)
    board.setup_game
    game = TurnManager.new(board, player_1, cpu)
    game_loop(board, game, cpu)
  else
    puts "Thanks for playing"
  end
end


def game_loop(board, game, cpu)
  loop do
    game.start_turn
    # test for win conditions
    game.cpu_turn
    # test for win conditions
    if board.draw?
      puts "It's a draw"
      board.render_board
      board.clear_board
      break
    end
  end
  main_menu(board, cpu)
end

main_menu(board, cpu)

# player_1 = main_menu(power_button)
# if player_1.is_a?(Player)
#   game = TurnManager.new(board, player_1, cpu)
# end



