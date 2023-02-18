require_relative 'player'
require_relative 'game'

p1 = Player.new(1)
p2 = Player.new(2)
game_object = Game.new(p1, p2)
turn_count = 1
while !game_object.winner?('X') &&
      !game_object.winner?('O') &&
      !game_object.draw?
  current_player = turn_count.odd? ? p1 : p2
  puts ''
  puts ''
  game_object.show_board
  puts ''
  puts ''
  puts "What move would you like to make, Player #{current_player.number}?"
  move = gets.chomp
  until game_object.valid_move?(move)
    puts ''
    puts ''
    puts "Sorry, Player #{current_player.number}. That move was incorrect."
    puts ''
    puts ''
    game_object.show_board
    puts ''
    puts ''
    puts 'Please enter a, b, or c followed by a number 1, 2, 3.'
    move = gets.chomp
  end
  game_object.make_move(move, current_player.marker)
  turn_count += 1
end
puts ''
puts ''
game_object.show_board
puts ''
puts ''
if !game_object.draw?
  puts "Congradulations Player #{current_player.number} you have won!"
else
  puts 'Game ended in a draw!'
end
puts ''
puts ''
