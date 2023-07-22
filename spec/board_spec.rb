require_relative 'spec_helper'

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
      @board.setup_game

      expect(@board.play_area.values.flatten).to all be_a Token
    end
  end

  describe "#read_cell" do
    it "can read the value of a token on the play_area" do
      @board.setup_game

      expect(@board.read_cell(:A, 1)).to eq(".")
    end
  end

  describe "#render_board" do
    it "can print the board to the console" do
      @board.setup_game
      @board.render_board
      @board.play_area[:A][-1].type = 'X'

      @board.render_board # "X" is bottom left of board, confirming assumptions
    end
  end

  describe "#clear_board" do
    it "can clear the board to ready for another game" do
      @board.setup_game

      expect(@board.play_area.values.flatten).to all be_a Token

      @board.clear_board

      expect(@board.play_area.values).to all eq([])
    end
  end

  describe "#place_piece" do
    it "can place a piece in a selected column" do
      @board.setup_game
      @board.place_piece(:B, "X")
      @board.render_board

      expect(@board.play_area[:B].last.type).to eq("X")
    end

    it "can detect when an invalid row (outside A-G) is selected" do
      @board.setup_game

      expect(@board.place_piece(:Y, "X")).to eq("invalid column")
    end

    it "can detect when a column is full, and return invalid selection" do
      @board.setup_game
      @board.place_piece(:B, "X")
      @board.place_piece(:B, "X")
      @board.place_piece(:B, "X")
      @board.place_piece(:B, "X")
      @board.place_piece(:B, "X")
      @board.place_piece(:B, "X")
      
      expect(@board.place_piece(:B, "X")).to eq("invalid column, column full")
    end

    it "can detect when a draw happens due to all columns being full" do
      @board.setup_game
      @board.set_draw_test
      @board.render_board
      expect(@board.draw?).to eq(true)
    end
  end

  describe "Helper method #token_positions_by_type" do
    it "can give positions of all pieces of one type" do
      dave = Player.new("x")
      @board.setup_game

      dave.place_piece(:A, @board)
      dave.place_piece(:D, @board)

      @board.render_board

      expect(@board.token_positions_by_type("X")).to eq(["A5", "D5"])
    end
  end
end