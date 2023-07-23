class CheckerCriteria
  attr_reader :win, :winner
  def initialize
    @win = false
    @winner = nil
    @positive_diagonals = [["A5", "B4", "C3", "D2"], 
    ["A4", "B3", "C2", "D1"], 
    ["A3", "B2", "C1", "D0"], 
    ["B5", "C4", "D3", "E2"], 
    ["B4", "C3", "D2", "E1"], 
    ["B3", "C2", "D1", "E0"], 
    ["C5", "D4", "E3", "F2"], 
    ["C4", "D3", "E2", "F1"], 
    ["C3", "D2", "E1", "F0"], 
    ["D5", "E4", "F3", "G2"], 
    ["D4", "E3", "F2", "G1"], 
    ["D3", "E2", "F1", "G0"]]

    @negative_diagonals = 
    [["D5", "C4", "B3", "A2"],
    ["D4", "C3", "B2", "A1"],
    ["D3", "C2", "B1", "A0"],
    ["E5", "D4", "C3", "B2"],
    ["E4", "D3", "C2", "B1"],
    ["E3", "D2", "C1", "B0"],
    ["F5", "E4", "D3", "C2"],
    ["F4", "E3", "D2", "C1"],
    ["F3", "E2", "D1", "C0"],
    ["G5", "F4", "E3", "D2"],
    ["G4", "F3", "E2", "D1"],
    ["G3", "F2", "E1", "D0"]]

    @columns = [:A, :B, :C, :D, :E, :F, :G]
  end
  
  def token_positions_by_type(type, board)
    counter = 0
    single_array =[]
    until counter == 7
    board.play_area[@columns[counter]].select.with_index do |point, index| 
      if point.type == type
        single_array << "#{@columns[counter].to_s}#{index}"
      end #if
      end #do
      counter += 1
    end #until
    single_array
  end #def

  def test_for_diagonal_wins(board)
    @positive_diagonals.each do |win| if (win - token_positions_by_type("X", board)).empty?
      @win = true
      @winner = "X"
      end
    end
    @negative_diagonals.each do |win| if (win - token_positions_by_type("X", board)).empty?
      @win = true
      @winner = "X"
      end
    end
    @positive_diagonals.each do |win| if (win - token_positions_by_type("O", board)).empty?
      @win = true
      @winner = "O"
      end
    end
    @negative_diagonals.each do |win| if (win - token_positions_by_type("O", board)).empty?
      @win = true
      @winner = "O"
      end
    end
    @win
  end

  def check_vertical_win(board)
    vert_strings = board.play_area.values.map do |column|
      column.map {|token| token.type}
    end
    vert_wins = vert_strings.map {|col| col.join}
    vert_wins.any? {|str| str.include?("XXXX") || str.include?("OOOO")}
  end

  def check_horizontal_win(board)
    horizontal_strings = board.play_area.values.transpose.map do |row|
      row.map {|token| token.type}
    end
    horizontal_wins = horizontal_strings.map {|row| row.join}
    if horizontal_wins.any? {|str| str.include?("XXXX")} 
      @win = true  
      @winner = "X"
    elsif horizontal_wins.any? {|str| str.include?("OOOO")} 
      @win = true  
      @winner = "O"
    end

  end


  def check_win_conditions(board)
    check_vertical_win(board) || check_horizontal_win(board) || test_for_diagonal_wins(board)
  end

end


# columns = [:A, :B, :C, :D, :E, :F, :G]

# string_columns = ["A", "B", "C", "D", "E", "F", "G"]
# index = [3, 4, 5, 6]
# counters = [5, 4, 3]

# temp = [[3, 5], [3, 4], [3, 3], [4, 5], [4, 4], [4, 3], [5, 5], [5, 4], [5, 3], [6, 5], [6, 4], [6, 3]]
#  map = []

# # map = temp.map { |letter| letter counters.each {|number| letter << number.to_s}}

# # p map

#  p index.product(counters)
# # start = [["A", 5], ["A", 4], ["A", 3], ["B", 5], ["B", 4], ["B", 3], ["C", 5], ["C", 4], ["C", 3], ["D", 5], ["D", 4], ["D", 3]]
# # start = [[0, 5], [0, 4], [0, 3], [1, 5], [1, 4], [1, 3], [2, 5], [2, 4], [2, 3], [3, 5], [3, 4], [3, 3]]

#  temp.each do | a, b| 
#   a_counter = 0
#   b_counter = 0

#   thing = []
  
#   04.times do
#     thing << [string_columns[a + a_counter] + (b + b_counter).to_s]
#     a_counter -= 1
#     b_counter -= 1
#   end

#   p thing.flatten(1)
#  end

# p map.flatten
#  p ([1, 2, 2] - [ 1, 2, 3, 4, 5]).empty?
#  p ([1, 2, 6] - [ 1, 2, 3, 4, 5]).empty?

#  p [ 1, 2, 3, 4, 5] - [1, 2]


