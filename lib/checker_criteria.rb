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

  def check_win_conditions(board)
    check_vertical_win(board) || check_horizontal_win(board) || test_for_diagonal_wins(board)
  end

  #Private
  
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
    if vert_wins.any? { |str| str.include?("XXXX") }
      @win = true  
      @winner = "X"
    elsif vert_wins.any? { |str| str.include?("OOOO") }
      @win = true  
      @winner = "O"
    end
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
end


