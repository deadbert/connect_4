require "spec_helper"

describe ComputerSmart do

let (:dave) {dave = Player.new("x")}
let (:sally) {sally = Player.new("O")}
let (:board) {board = Board.new}
let (:checker) {checker = CheckerCriteria.new}
let (:hal) {hal = ComputerSmart.new}

it "find empty" do
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

  expect(hal.find_empty(6, board)).to eq(4)
  end
  
  it "test diagonal" do
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
  
    board.render_board
  
    hal.tester(3, board, 1 , -1)

    expect(hal.main_counter).to eq(3)
  end






end