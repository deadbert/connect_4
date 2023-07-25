class GameManager 

  def main_menu(board)
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
      cpu = ComputerRandom.new(player_1.type)
      board.setup_game
      game = TurnManager.new(board, player_1, cpu)
      game_loop(board, game, cpu)
    else
      puts "Thanks for playing"
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
    main_menu(board)
  end

end