require 'ruby2d'
require './lib/require_helper'

# board = Board.new
# board.setup_game
# checker = CheckerCriteria.new
# player_1 = Player.new("X")
# cpu = ComputerRandom.new(player_1.type)
# game = TurnManager.new(board, player_1, cpu)

set width: 775
set height: 800

# cordinate data for rendering blank squares, as well as X's and O's when placed
# symbols correspond to the return from Player.place_piece and TurnManager.cpu_turn
cordinates =  {
  A5: [50, 700], A4: [50, 600], A3: [50, 500], A2: [50, 400], A1: [50, 300], A0: [50, 200],
  B5: [150, 700], B4: [150, 600], B3: [150, 500], B2: [150, 400], B1: [150, 300], B0: [150, 200],
  C5: [250, 700], C4: [250, 600], C3: [250, 500], C2: [250, 400], C1: [250, 300], C0: [250, 200],
  D5: [350, 700], D4: [350, 600], D3: [350, 500], D2: [350, 400], D1: [350, 300], D0: [350, 200],
  E5: [450, 700], E4: [450, 600], E3: [450, 500], E2: [450, 400], E1: [450, 300], E0: [450, 200],
  F5: [550, 700], F4: [550, 600], F3: [550, 500], F2: [550, 400], F1: [550, 300], F0: [550, 200],
  G5: [650, 700], G4: [650, 600], G3: [650, 500], G2: [650, 400], G1: [650, 300], G0: [650, 200]

}

def set_up_game_manager
  board = Board.new
  board.setup_game
  player_1 = Player.new("X")
  cpu = ComputerRandom.new(player_1.type)
  TurnManager.new(board, player_1, cpu)
end

game = set_up_game_manager

# Uses cordinates Hash to render blank square positions representing connect 4 board
def render_game(cordinates, board)
  set title: "Connect 4"
  set background: "blue"
  cordinates.each do |key, values|
    Square.new(
      x: values[0], y: values[1],
      size: 50,
      color: 'white', opacity: 1,
      z: 0
    )
  end
end

# Helper method returns the corresponding symbol for selected column to drop token
def find_column(event)
  return :A if event.x > 50 && event.x < 100
  return :B if event.x > 150 && event.x < 200
  return :C if event.x > 250 && event.x < 300
  return :D if event.x > 350 && event.x < 400
  return :E if event.x > 450 && event.x < 500
  return :F if event.x > 550 && event.x < 600
  return :G if event.x > 650 && event.x < 700
  return "out of range"
end

# method gathers cordinates token is placed at, and uses cordinates hash to render
# token in the correct placement
def render_token(cords, type, cordinates)
  Text.new(
    "#{type}",
    x: cordinates[cords][0] + 5, y: cordinates[cords][1] -10,
    style: 'bold',
    size: 50,
    color: 'red'
  )
end

# Images used for showing a game over message on screen
def render_game_over
  Text.new(
    "Game Over",
    x: 125, y: 0,
    style: 'bold',
    size: 100,
    color: 'red'
  )
  Text.new(
    "press p to play again, or q to quit",
    x: 130, y: 125,
    size: 35,
    color: 'red'
  )
end

# key down and mouse down methods for game selection and token position selection
on :key_down do |event|
  if event.key == "p"
    clear
    game.reset_game
    render_game(cordinates, game.board)
  end
  if event.key == "q"
    close
  end
end

on :mouse_down do |event|
    checker = CheckerCriteria.new
    column = find_column(event)
    render_token(game.player.place_piece(column, game.board), game.player.type, cordinates)
    cpu_token = game.cpu_turn
    render_token(cpu_token, game.cpu.type, cordinates)
    game.board.render_board
    if checker.check_win_conditions(game.board)
      game.board.clear_board
      game.board.setup_game
      render_game_over
    end
end
# key down and mouse down methods for game selection and token position selection

# set up the first start screen with p to play and q to quit options
def render_start_screen
  Text.new(
    "Welcome to connect 4",
    x: 125, y: 325,
    style: 'bold',
    size: 50,
    color: 'red'
  )
  Text.new(
    "press p to play again, or q to quit",
    x: 130, y: 475,
    size: 35,
    color: 'red'
  )
end

render_start_screen
# set up the first start screen with p to play and q to quit options

show

