require_relative 'spec_helper'
describe Player do 
  let (:dave) {dave = Player.new("x")}
  let (:board) {board = Board.new}
  describe "set-up" do
    it "t1 exits and has type" do
      expect(dave).to be_a(Player)
      expect(dave.type).to eq("X")
    end

    it "can take a variety of characters for teams" do
      andy = Player.new(2)
      blake = Player.new("x")
      clyde = Player.new("X")
      doug = Player.new(1)
      evie = Player.new("o")
      flannery = Player.new("O")
      greg= Player.new(0)

      expect(andy.type).to eq("X")
      expect(blake.type).to eq("X")
      expect(clyde.type).to eq("X")
      expect(doug.type).to eq("O")
      expect(evie.type).to eq("O")
      expect(flannery.type).to eq("O")
      expect(greg.type).to eq("O")
    end
  end


  describe "actions" do
    it "can place a piece and on his team" do
      dave.place_piece(:A, board)
      dave.place_piece(:D, board)

      expect(board.read_cell(:A, -1)).to eq("X")
      expect(board.read_cell(:D, -1)).to eq("X")
    end
  end
end

