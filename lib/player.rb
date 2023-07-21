class Player
  attr_reader :type
  def initialize(type)
    @type = find_type(type)
  end

  def find_type(type)
    case type
    when 2, "x", "X"
      "X"
    when 1, "o", "O", 0
      "O"
    end
  end

  def place_piece(column, board)
    board.place_piece(column, @type)
  end
end
