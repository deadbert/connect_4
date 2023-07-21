require './lib/board'
require './lib/token'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe "#initilize" do
    it "exists as a Board" do

      expect(@board).to be_a Board
    end

    it "contains a Hash with nested Arrays for each column" do

      expect(@board.play_area).to be_a Hash
      expect(@board.play_area.values).to all be_a Array
    end

    it "starts with an empty board" do

      expect(@board.play_area.values).to all eq([])
    end
  end

  describe "#setup_game" do
    it "Adds tokens to board to represent blank cells" do
      require 'pry';binding.pry
      @board.setup_game

      expect(@board.play_area.values).to all be_a Token
    end
  end
end