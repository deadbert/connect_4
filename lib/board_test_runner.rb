require_relative 'board'
require_relative 'token'
require_relative 'player'

board = Board.new
board.setup_game

on = true
puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit"
choice = gets.chomp

if choice.downcase == "p"
  puts "would you like X's or O's?('x/o')"
  selection = gets.chomp
  player_1 = Player.new(selection)
end


