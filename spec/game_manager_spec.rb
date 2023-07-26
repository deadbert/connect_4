require_relative 'spec_helper'

describe GameManager do
  let(:manager) {manager = GameManager.new}
  describe "#initialize" do
    it "exists" do
      
      expect(manager).to be_a(GameManager)
    end
  end

  describe "#check_re_render" do
    it "checks win conditions, clears the board and returns true/false for game over" do
      board = Board.new
      board.setup_game
      checker = CheckerCriteria.new

      expect(manager.check_re_render(board, checker)).to eq(false)

      4.times {board.place_piece(:A, "X")}

      expect(manager.check_re_render(board, checker)).to eq(true)
    end
  end
end