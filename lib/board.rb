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
      row = [@play_area[:A][i].type, @play_area[:B][i].type, @play_area[:C][i].type, @play_area[:D][i].type, @play_area[:E][i].type, @play_area[:F][i].type, @play_area[:G][i].type].join
      puts row
      i += 1
    end
  end
end