require "spec_helper"

describe ComputerSmart do

let (:dave) {dave = Player.new("x")}
let (:sally) {sally = Player.new("O")}
let (:board) {board = Board.new}
let (:checker) {checker = CheckerCriteria.new}
let (:hal) {hal = ComputerSmart.new}

it "can give positions of all pieces of one type" do
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
  # sally.place_piece(:D, board)

  board.render_board

  expect(hal.find_empty(:G, board)).to eq("O")
  end
end