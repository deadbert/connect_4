class WinChecker

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
    horizontal_wins.any? {|str| str.include?("XXXX") || str.include?("OOOO")}  
  end
end

# manual long form loop for vert check
# can use .transpose ans same loop for horizontal check
    # board.play_area.values.each do |column|
    #   i = -1
    #   line = 1
    #   max_in_line = 0
    #   until i == -6
    #     if column[i].type == column[i-1].type
    #       line += 1
    #       i -= 1
    #     else
    #       max_in_line = line
    #       line = 0
    #       i -= 1
    #     end
    #   end
    #   return true if max_in_line >= 4
    # end
    # false