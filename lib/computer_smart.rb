class ComputerSmart
  attr_reader :type, :enemy, :main_counter, :placement_column
  def initialize(type = "X") #default needs to be removed eventually
    @type = OPPONENT[type]
    @enemy = type
    @main_counter = 0
    @placement_column = nil
  end

  OPPONENT = {"O"=>"X", "X"=>"O"}
  COLUMNS_SYM = [:A, :B, :C, :D, :E, :F, :G]



  def tester(board)
    [*0..6].each do |column_number| 
      compass_tester(column_number, board, 1, -1)
      compass_tester(column_number, board, -1, -1)
      compass_tester(column_number, board, 1, 0)
      compass_tester(column_number, board, 0, -1)
    end
    board.place_piece(COLUMNS_SYM[@placement_column])
  end


  def compass_tester(column_number, board, array_number_num, item_number_num)
    counter = 0
    array_number = column_number 
    item_number = find_empty(column_number, board)
    rev_array_number = column_number 
    rev_item_number = find_empty(column_number, board)
    loop do
      array_number += array_number_num
      item_number += item_number_num
      break if array_number > 6 || array_number < 0
      break if item_number > 5 || item_number < 0
      break if board.play_area[COLUMNS_SYM[array_number]][item_number].type == "."
      break if board.play_area[COLUMNS_SYM[array_number]][item_number].type == @enemy
      counter += 1
    end
    loop do
      rev_array_number += array_number_num * -1
      rev_item_number += item_number_num * -1
      break if rev_array_number > 6 || rev_array_number < 0
      break if rev_item_number > 5 || rev_item_number < 0
      break if board.play_area[COLUMNS_SYM[rev_array_number]][rev_item_number].type == "."
      break if board.play_area[COLUMNS_SYM[rev_array_number]][rev_item_number].type == @enemy
      counter += 1
    end
    if counter > @main_counter
      @main_counter = counter 
      @placement_column = column_number
    end
  end



  def find_empty(column_number, board)
    i = 5
    previous = nil
    loop do
      if board.play_area[COLUMNS_SYM[column_number]][i].type == "."
        return previous = i 
      end
      i -= 1
      break if i == -1
    end
    previous
  end







end