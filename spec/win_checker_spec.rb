require_relative 'spec_helper'
require './lib/win_checker'

describe WinChecker do
  let(:checker) {checker = WinChecker.new}
  let(:board) {board = Board.new}
  describe "#initialize" do
    it "exists" do

      expect(checker).to be_a(WinChecker)
    end
  end

  describe "#check_vertical_win" do
    it "can detect 4 in a row on vertical axis" do
      board.setup_game
      # expect(checker.check_vertical_win(board)).to eq(false)

      4.times {board.place_piece(:A, "X")}
      
      expect(checker.check_vertical_win(board)).to eq(true)
    end
  end

  describe "#check_horizontal_win" do
    it "can detect 4 in a row on horizontal axis" do
      
      board.setup_game
      expect(checker.check_horizontal_win(board)).to eq(false)
      board.place_piece(:A, "X")
      board.place_piece(:B, "X")
      board.place_piece(:C, "X")
      board.place_piece(:D, "X")

      expect(checker.check_horizontal_win(board)).to eq(true)
    end
  end
end