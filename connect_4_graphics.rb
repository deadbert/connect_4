require 'ruby2d'
require './lib/require_helper'

board = Board.new
board.setup_game
checker = CheckerCriteria.new
player_1 = Player.new("X")
cpu = ComputerRandom.new(player_1.type)
game = TurnManager.new(board, player_1, cpu)

set title: "Connect 4"
set background: "white"
set width: 775
set height: 800

cordinates =  {
  A5: [50, 700], A4: [50, 600], A3: [50, 500], A2: [50, 400], A1: [50, 300], A0: [50, 200],
  B5: [150, 700], B4: [150, 600], B3: [150, 500], B2: [150, 400], B1: [150, 300], B0: [150, 200],
  C5: [250, 700], C4: [250, 600], C3: [250, 500], C2: [250, 400], C1: [250, 300], C0: [250, 200],
  D5: [350, 700], D4: [350, 600], D3: [350, 500], D2: [350, 400], D1: [350, 300], D0: [350, 200],
  E5: [450, 700], E4: [450, 600], E3: [450, 500], E2: [450, 400], E1: [450, 300], E0: [450, 200],
  F5: [550, 700], F4: [550, 600], F3: [550, 500], F2: [550, 400], F1: [550, 300], F0: [550, 200],
  G5: [650, 700], G4: [650, 600], G3: [650, 500], G2: [650, 400], G1: [650, 300], G0: [650, 200]

}

cordinates.each do |key, values|
  Square.new(
    x: values[0], y: values[1],
    size: 50,
    color: 'blue', opacity: 0.2,
    z: 0
  )
end

def find_column(event)
  return :A if event.x > 50 && event.x < 100
  return :B if event.x > 150 && event.x < 200
  return :C if event.x > 250 && event.x < 300
  return :D if event.x > 350 && event.x < 400
  return :E if event.x > 450 && event.x < 500
  return :F if event.x > 550 && event.x < 600
  return :G if event.x > 650 && event.x < 700
end

def render_token(cords, type, cordinates)
  Text.new(
    "#{type}",
    x: cordinates[cords][0] + 5, y: cordinates[cords][1] -10,
    style: 'bold',
    size: 50,
    color: 'red'
  )
end

def render_game_over
  set background: 'blue'
  Text.new(
    "Game Over",
    x: 125, y: 325,
    style: 'bold',
    size: 100,
    color: 'red'
  )
  Text.new(
    "press p to play again, or q to quit",
    x: 130, y: 475,
    size: 35,
    color: 'red'
  )
end

on :key_down do |event|
  if event.key == "p"
    puts "it's p"
  end
  if event.key == "q"
    puts "it's a q"
  end
end

on :mouse_down do |event|
    column = find_column(event)
    render_token(player_1.place_piece(column, board), player_1.type, cordinates)
    cpu_token = game.cpu_turn
    render_token(cpu_token, cpu.type, cordinates)
    board.render_board
    if checker.check_win_conditions(board)
      board.clear_board
      clear 
      render_game_over
    end
end

show

