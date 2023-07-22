require_relative 'spec_helper'

describe TurnManager do
  before(:each) do
    @board = Board.new
    @player = Player.new("X")
    @game = TurnManager.new(@board, @player)
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
  end
end