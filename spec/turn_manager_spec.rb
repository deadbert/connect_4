require_relative 'spec_helper'

describe TurnManager do
  before(:each) do
    @board = Board.new
    @player = Player.new("X")
    @cpu = ComputerRandom.new
    @game = TurnManager.new(@board, @player, @cpu)
  end
  describe "#initialize" do
    it "exists as a Turn manager" do

      expect(@game).to be_a(TurnManager)
    end

    it "contains a player object" do

      expect(@game.player).to be_a(Player)
    end

    it "contains a board object" do 

      expect(@game.board).to be_a(Board)
    end

    it "contains a ComputerRandom object" do

      expect(@game.cpu).to be_a(ComputerRandom)
    end
  end
end