require_relative 'require_helper'

class GameManager 

  def start_game(board)
    puts "Welcome to CONNECT FOUR"
    puts "Enter p to play. Enter q to quit"
    choice = gets.chomp
  
    if choice.downcase == "p"
      selection = ''
      until selection == "x" || selection == "o"
        puts "would you like X's or O's?('x/o')"
        selection = gets.chomp
      end
      player_1 = Player.new(selection)
      cpu = select_cpu_type(player_1)
      until cpu.is_a?(ComputerRandom) || cpu.is_a?(ComputerSmart)
        cpu = select_cpu_type
      end 
      board.setup_game
      game = TurnManager.new(board, player_1, cpu)
      game_loop(board, game, cpu)
    elsif choice.downcase == "q"
      return false
    else
      puts "Invalid choice"
      start_game(board)
    end
  end

  def game_loop(board, game, cpu)
    checker = CheckerCriteria.new
    loop do
      game.start_turn
      if checker.check_win_conditions(board)
        board.render_board
        board.clear_board
        puts "Game Over: #{checker.winner} wins"
        break
      end
      game.cpu_turn
      if checker.check_win_conditions(board)
        board.render_board
        board.clear_board
        puts "Game Over: #{checker.winner} wins"
        break
      end
      if board.draw?
        puts "It's a draw"
        board.render_board
        board.clear_board
        break
      end
    end
    start_game(board)
  end

  def select_cpu_type(player)
    puts "s for smart computer, r for random computer"
      choice = gets.chomp
      if choice == 's'
        cpu = ComputerSmart.new(player.type)
      elsif choice == 'r'
        cpu = ComputerRandom.new(player.type)
      else
        puts "invalid selection"
      end
  end

end