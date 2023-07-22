require_relative "spec_helper"
describe ComputerRandom do
  let (:board) {board = Board.new}
  let (:hal) {hal = ComputerRandom.new}
  describe "setup" do
    # let (:andrew) {andrew = Player.new("x")}
    it "exists and takes left-over type" do
      andrew = Player.new("x")

      expect(hal).to be_a(ComputerRandom)

      expect(hal.type).to eq("O")
      expect(hal.enemy).to eq("X")
    end
  end

  describe "place piece" do
    it "can place a pieces" do
      board.setup_game
      andrew = Player.new("x")
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      board.render_board
    
      expect(board.play_area.values.flatten.count { |token| token.type == "O"}).to eq(5)
    end

    it "can place a piece at a random spot" do
      board.setup_game
      andrew = Player.new("x")
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      hal.place_piece(board)
      board.render_board
    
      expect(board.play_area.values.flatten.count { |token| token.type == "O"}).to eq(5)

      expect(board.play_area[:A].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:B].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:C].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:D].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:E].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:F].count{ |object| object.type == "O" }).to (be < 5)
      expect(board.play_area[:G].count{ |object| object.type == "O" }).to (be < 5)
    end
  end
end