require_relative 'token'

class Board
  attr_reader :header, :columns
  attr_accessor :play_area

  def initialize
    @play_area = {
      A: [],
      B: [],
      C: [],
      D: [],
      E: [],
      F: [],
      G: []
    }
    @columns = @play_area.keys
  end

  def setup_game
    @play_area.values.each do |column|
      6.times {column.append(Token.new)}
    end
  end

  def read_cell(column, row)
    row -= 1
    @play_area[column][row].type
  end

  def render_board
    puts @play_area.keys.join
    board_array = @play_area.values.transpose
    rows = board_array.map {|row| row.map {|token| token.type}}
    rows.each {|line| puts line.join}
  end

  def clear_board
    initialize
  end

  def place_piece(column, piece_type)
    return "invalid column" if !@columns.include?(column)
    i = -1
    loop do
      if @play_area[column][i].type == "."
        @play_area[column][i].type = piece_type
        cord = "#{column}#{i+6}"
        return cord.intern
      end
      i -= 1
      return "invalid column, column full" if i < -6
    end
  end

  def draw? #allways call win condition test first
    all_tokens = @play_area.values.flatten
    return false if all_tokens.any? {|token| token.type == "."}
    true
  end

  def set_draw_test
    @play_area.each {|k,v| v.each {|token| token.type = "X"}}
  end
    # test if render_board outputs correct rows/columns
  # by comparing to manually setting rows/columns
  # def render_board_manual
  #   puts @play_area.keys.join
  #   i = 0
  #   rows = 5
  #   until i > rows do
  #     row = form_row(i)
  #     puts row
  #     i += 1
  #   end
  # end

  # def form_row(num)
  #   [@play_area[:A][num].type, @play_area[:B][num].type, 
  #   @play_area[:C][num].type, @play_area[:D][num].type, 
  #   @play_area[:E][num].type, @play_area[:F][num].type, 
  #   @play_area[:G][num].type].join
  # end

  # def token_positions_by_type(type)
  #   counter = 0
  #   single_array =[]
  #   until counter == 7
  #   @play_area[@columns[counter]].select.with_index do |point, index| 
  #     if point.type == type
  #       single_array << "#{@columns[counter].to_s}#{index}"
  #     end #if
  #     end #do
  #     counter += 1
  #   end #until
  #   single_array
  # end #def
end