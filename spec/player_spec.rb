require_relative 'spec_helper'
describe Player do 
  let (:dave) {dave = Player.new("x")}
  describe "set-up" do
    it "t1 exits and has type" do
      expect(dave).to be_a(Player)
      expect(dave.type).to eq("x")
    end

  describe "actions" do
    it "can place a piece and on his team" do
      dave.place_piece("a")
      dave.place_piece("D")

      expect(board.read_cell(:A, -1)).to eq("X")
      expect(board.read_cell(:D, -1)).to eq("X")
    end
  end

