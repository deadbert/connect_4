require_relative "spec_helper"
describe ComputerRandom do
  describe "setup" do
    # let (:andrew) {andrew = Player.new("x")}
    let (:board) {board = Board.new}
    let (:hal) {hal = ComputerRandom.new}
    it "exists and takes left-over type" do
      andrew = Player.new("x")

      expect(hal).to be_a(ComputerRandom)

      expect(hal.type).to eq("O")
      expect(hal.enemy).to eq("X")
    end
  end

  # describe "place piece" do
  #   it "can place a piece at a random spot" do
  #     board.setup_game
  #     andrew = Player.new("x")
  #     hal.place_piece(board)
  #     hal.place_piece(board)
  #     hal.place_piece(board)
  #     board.render_board
    

  #     expect(board.play_area[:A].count("O")).to (be < 3)
  #     expect(board.play_area[:B].count("O")).to (be < 3)
  #     expect(board.play_area[:C].count("O")).to (be < 3)
  #     expect(board.play_area[:D].count("O")).to (be < 3)
  #     expect(board.play_area[:E].count("O")).to (be < 3)
  #     expect(board.play_area[:F].count("O")).to (be < 3)
  #     expect(board.play_area[:G].count("O")).to (be < 3)
  #   end
  end
end