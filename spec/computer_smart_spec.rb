require "spec_helper"

describe ComputerSmart do

let (:dave) {dave = Player.new("x")}
let (:sally) {sally = Player.new("O")}
let (:board) {board = Board.new}
let (:checker) {checker = CheckerCriteria.new}
let (:hal) {hal = ComputerSmart.new}
let (:ref) {ref = CheckerCriteria.new}

  describe "exits and has attributes" do
    it "exits and has attributes" do
      expect(hal).to be_a ComputerSmart

      expect(hal.type).to eq("O")
      expect(hal.enemy).to eq("X")
      expect(hal.main_connected_tokens).to eq(0)
      expect(hal.placement_column).to be nil
    end
  end
  
  describe "method: find_empty" do
    it "can find the first empty space in a column" do
      board.setup_game

      dave.place_piece(:D, board)
      dave.place_piece(:E, board)
      dave.place_piece(:F, board)
      sally.place_piece(:G, board)
      sally.place_piece(:F, board)
      sally.place_piece(:E, board)
      sally.place_piece(:E, board)
      sally.place_piece(:D, board)
      sally.place_piece(:D, board)
      sally.place_piece(:D, board)

      expect(hal.find_empty(6, board)).to eq(4)
    end
  end


  describe "method: compass_tester" do
    it ",given a column, 2 directions, and token type, can tell how many tokens are in a row" do
      board.setup_game

      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)
    
      hal.compass_tester(3, board, 1 , -1, "X", false)

      expect(hal.main_connected_tokens).to eq(3)
      expect(hal.placement_column).to eq(3)
    end
  end

  describe "method: tester" do
    it "will run the compass testers in four directions for each column" do
      board.setup_game

      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)

      hal.tester(board, "X", false)

      expect(hal.main_connected_tokens).to eq(3)
      expect(hal.placement_column).to eq(3)
    end
  end
  
  describe "method: place_piece" do
    it "will place a piece to connect four for a + diagonal win" do
      board.setup_game

      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)

      expect(ref.check_win_conditions(board)).to be false

      hal.place_piece(board)

      expect(ref.check_win_conditions(board)).to be true
    end

    it "will place a piece to connect four for a - diagonal win" do
      board.setup_game

      dave.place_piece(:B, board)
      dave.place_piece(:B, board)
      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:D, board)
      sally.place_piece(:B, board)
      sally.place_piece(:D, board)
      sally.place_piece(:E, board)

      expect(ref.check_win_conditions(board)).to be false

      hal.place_piece(board)

      expect(ref.check_win_conditions(board)).to be true
    end

    it "will place a piece to connect four for a horizontal win" do
      board.setup_game

      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)
      sally.place_piece(:F, board)

      expect(ref.check_win_conditions(board)).to be false

      hal.place_piece(board)

      expect(ref.check_win_conditions(board)).to be true
    end













  end





end