require_relative 'spec_helper'
describe CheckerCriteria do
  let (:dave) {dave = Player.new("x")}
  let (:sally) {sally = Player.new("O")}
  let (:board) {board = Board.new}
  let (:checker) {checker = CheckerCriteria.new}
  describe "Set_up" do
    it "exists and has attributes" do
      expect(checker).to be_a(CheckerCriteria)

      expect(checker.win).to be false
      expect(checker.winner).to be nil
    end
  end
  describe "method: token_positions_by_type " do
    it "can give positions of all pieces of one type" do
      board.setup_game

      dave.place_piece(:A, board)
      dave.place_piece(:B, board)
      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      sally.place_piece(:C, board)
      dave.place_piece(:C, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)

      board.render_board

      expect(checker.token_positions_by_type("X", board)).to eq(["A5", "B4", "B5", "C3", "C5", "D2", "D4"])
    end
  end
  
  describe "method:test_for_diagonal_wins " do
    
    it "will test for positive diagonals" do
      board.setup_game
      
      expect(checker.win).to be false

      dave.place_piece(:A, board)
      dave.place_piece(:B, board)
      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      sally.place_piece(:C, board)
      dave.place_piece(:C, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)
  
      board.render_board
  
      checker.test_for_diagonal_wins(board)

      expect(checker.win).to be true
      expect(checker.winner).to eq("X")
    end
    
    it "will test for negative diagonals wins" do
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
      sally.place_piece(:D, board)

      board.render_board
  
      checker.test_for_diagonal_wins(board)

      expect(checker.winner).to eq("O")
    end
  end

  describe "test major directions for wins" do 
    it "will test for horizontal wins" do
      board.setup_game
  
      dave.place_piece(:A, board)
      dave.place_piece(:C, board)
      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)
      sally.place_piece(:D, board)
      sally.place_piece(:D, board)

      board.render_board
  
      checker.check_horizontal_win(board)

      expect(checker.winner).to eq("O")
    end

    it "will test for vertical wins" do
      board.setup_game
  
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)

      board.render_board
  
      checker.check_vertical_win(board)

      expect(checker.winner).to eq("X")
    end
  end

  describe "method: check_win_conditions" do
    it "can check for a vertical win" do
        board.setup_game

      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)
      dave.place_piece(:C, board)

      board.render_board

      checker.check_vertical_win(board)

      expect(checker.winner).to eq("X")
    end

    it "can check for horizontal wins" do
      board.setup_game
  
      dave.place_piece(:A, board)
      dave.place_piece(:C, board)
      sally.place_piece(:A, board)
      sally.place_piece(:B, board)
      sally.place_piece(:B, board)
      sally.place_piece(:C, board)
      sally.place_piece(:D, board)
      sally.place_piece(:D, board)

      board.render_board
  
      checker.check_horizontal_win(board)

      expect(checker.winner).to eq("O")
    end

    it "will test for diagonals" do
      board.setup_game
      
      expect(checker.win).to be false

      dave.place_piece(:A, board)
      dave.place_piece(:B, board)
      dave.place_piece(:B, board)
      dave.place_piece(:C, board)
      sally.place_piece(:C, board)
      dave.place_piece(:C, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)
      sally.place_piece(:D, board)
      dave.place_piece(:D, board)
  
      board.render_board
  
      checker.test_for_diagonal_wins(board)

      expect(checker.win).to be true
      expect(checker.winner).to eq("X")
    end
  end
end

