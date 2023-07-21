require_relative 'token'

class Board
  attr_reader :header
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
    i = 0
    rows = 5
    until i > rows do
      row = form_row(i)
      puts row
      i += 1
    end
  end

  def form_row(num)
    [@play_area[:A][num].type, @play_area[:B][num].type, 
    @play_area[:C][num].type, @play_area[:D][num].type, 
    @play_area[:E][num].type, @play_area[:F][num].type, 
    @play_area[:G][num].type].join
  end
end