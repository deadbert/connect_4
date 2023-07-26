class ComputerSmart
  attr_reader :type, :enemy, :main_connected_tokens, :placement_column

  def initialize(type = "X") #default needs to be removed eventually
    @type = OPPONENT[type]
    @enemy = type
    @main_connected_tokens = 0
    @placement_column = nil
    @blocking = false
  end

  OPPONENT = {"O"=>"X", "X"=>"O"}
  COLUMNS_SYM = [:A, :B, :C, :D, :E, :F, :G]
  WEIGHTED_RANDOM = [:A, :A, :B, :B, :C, :C, :C, :C, :D, :D, :D, :E, :E, :E, :E, :F, :F, :G, :G]

  def place_piece(board)
    @main_connected_tokens = 0
    tester(board, @enemy, false)
    tester(board, @type, true)
    case @main_connected_tokens
    when 2..6
      board.place_piece(COLUMNS_SYM[@placement_column], @type)
    else
      board.place_piece(WEIGHTED_RANDOM[rand(0..18)], @type)
    end
  end

# Private

  def tester(board, type_checker, blocking)
    [*0..6].each do |column_number| 
      compass_tester(column_number, board, 1, -1, type_checker, blocking) #checks positive diagonal
      compass_tester(column_number, board, -1, -1, type_checker, blocking) #checks negative diagonal
      compass_tester(column_number, board, 1, 0, type_checker, blocking) #checks horizontal
      compass_tester(column_number, board, 0, -1, type_checker, blocking) #checks vertical
    end
  end

  def compass_tester(column_number, board, array_number_num, item_number_num, type_checker, block)
    connected_tokens = 0
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
      break if board.play_area[COLUMNS_SYM[array_number]][item_number].type == type_checker
      connected_tokens += 1
    end
    loop do
      rev_array_number += array_number_num * -1
      rev_item_number += item_number_num * -1
      break if rev_array_number > 6 || rev_array_number < 0
      break if rev_item_number > 5 || rev_item_number < 0
      break if board.play_area[COLUMNS_SYM[rev_array_number]][rev_item_number].type == "."
      break if board.play_area[COLUMNS_SYM[rev_array_number]][rev_item_number].type == type_checker
      connected_tokens += 1
    end
    if connected_tokens > @main_connected_tokens && find_empty(column_number, board) < 6
      @main_connected_tokens = connected_tokens 
      @placement_column = column_number
      @blocking = block
    end
  end

  def find_empty(column_number, board)
    vertical_position = 5
    previous = 6
    loop do
      if board.play_area[COLUMNS_SYM[column_number]][vertical_position].type == "."
        return previous = vertical_position
      end
      vertical_position -= 1
      break if vertical_position <= -1
    end
    previous
  end

end