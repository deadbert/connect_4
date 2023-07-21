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

  # def setup_game
  #   @play_area.values.each do |
  # end
end