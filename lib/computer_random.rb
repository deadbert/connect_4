class ComputerRandom
  attr_reader :type, :enemy
  def initialize(type = "O")
    @type = type
    @enemy = OPPONENT[type]
  end

  OPPONENT = {"O"=>"X", "X"=>"O"}
  COLUMNS = ["A", "B", "C", "D", "E", "F", "G"]

  # def place_piece(board)
  #   board.place_piece(COLUMNS[rand(0..6)], @type)
  # end
end


