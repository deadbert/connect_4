require_relative 'require_helper'

class GameManager 

  def start_game(board)
    puts "Welcome to CONNECT FOUR"
    puts "Enter p to play. Enter q to quit"
    choice = gets.chomp
  
    if choice.downcase == "p"
      selection = ''
      player_1 = x_or_o
      cpu = select_cpu_type(player_1)
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
      break if check_re_render(board, checker)
      game.cpu_turn
      break if check_re_render(board, checker)
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
        select_cpu_type(player)
      end
  end

  def check_re_render(board, checker)
    if checker.check_win_conditions(board)
      board.render_board
      board.clear_board
      puts "Game Over: #{checker.winner} wins"
      return true
    end
    false
  end

  def x_or_o
    puts "would you like X's or O's?('x/o')"
    selection = gets.chomp
    if selection == "x"
      return player = Player.new("X")
    elsif selection == "o"
      return player = Player.new("O")
    else
      puts "invalid selecton"
      x_or_o
    end
  end
  
end