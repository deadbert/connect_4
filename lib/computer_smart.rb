class ComputerSmart
  attr_reader :type, :enemy
  def initialize(type = "X") #default needs to be removed eventually
    @type = OPPONENT[type]
    @enemy = type
    @main_counter = 0
    @column = nil
  end

  OPPONENT = {"O"=>"X", "X"=>"O"}
  # COLUMNS = ["A", "B", "C", "D", "E", "F", "G"]
  COLUMNS_SYM = [:A, :B, :C, :D, :E, :F, :G]

  # def place_piece(board)
  #   board.place_piece(COLUMNS[rand(0..6)], @type)
  # end

  def north_east(column_number)
    counter = 0
    array_number = column_number 
    item_number = find_empty(column, board)
    rev_array_number = column_number 
    rev_item_number = find_empty(column, board)
    loop do
      array_number += 1
      item_number += 1
      @board.play_area[COLUMNS_SYM[array_number]][item_number]
      break if nil || token.type == @enemy || token.type == "." 
      counter += 1
    end
    loop do
      array_number -= 1
      item_number -= 1
      @board.play_area[COLUMNS_SYM[array_number]][item_number]
      break if nil || token.type == @enemy || token.type == "." 
      counter += 1
    end
    @main = counter if counter > @main
  end



  def find_empty(column, board)
    i = 5
    previous = nil
    loop do
      if board.play_area[column][i].type == "."
        return previous = i 
      end
      i -= 1
      break if i == 0
    end
    previous
  end







end