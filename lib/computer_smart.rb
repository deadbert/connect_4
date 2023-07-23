class ComputerSmart
  attr_reader :type, :enemy
  def initialize(type = "O") #default needs to be removed eventually
    @type = type
    @enemy = OPPONENT[type]
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
    item_number = ?????
    rev_array_number = column_number 
    rev_item_number = ?????
    begin
      array_number += 1
      item_number += 1
      @board.play_area[COLUMNS_SYM[array_number]][item_number]
      next nil || token.type == @enemy || token.type == "." 
      counter += 1
    end
    begin 
      array_number -= 1
      item_number -= 1
      @board.play_area[COLUMNS_SYM[array_number]][item_number]
      next nil || token.type == @enemy || token.type == "." 
      counter += 1
    end
    @main = counter if counter > @main
  end



  def find_empty(column)
    i = -1
    loop do
      if board.play_area[column][i].type == "."
        return board.play_area[column][i].type = piece_type
      end
      i -= 1
      return nil if i < -6
    end
  end







end