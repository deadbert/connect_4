class TurnManager
  attr_reader :board, :player, :cpu
  def initialize(board, player, cpu)
    @board = board
    @player = player
    @cpu = cpu
  end

  def start_turn
    @board.render_board
    puts "Select a column for your piece(A-G)"
    column = gets.chomp.upcase.intern
    new_token = @player.place_piece(column, @board)
    check_column(new_token)
  end

  def check_column(new_token)
    if new_token == "invalid column, column full" || new_token == "invalid column"
      until new_token != "invalid column, column full" && new_token != "invalid column"
        puts "#{new_token}"
        puts "Select another row(A-G)"
        column = gets.chomp.upcase.intern
        new_token = @player.place_piece(column, @board)
      end
    end
  end

  # method for cpu turn here
  def cpu_turn
    new_token = @cpu.place_piece(@board)
    if new_token == "invalid column, column full" || new_token == "invalid column"
      until new_token != "invalid column, column full" && new_token != "invalid column"
        new_token = @cpu.place_piece(@board)
      end
    end
  end
  # method to loop cpu turn on bad column input here

end