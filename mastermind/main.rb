require_relative 'player'
require_relative 'game'
require_relative 'cpu'

colors = ['red', 'green', 'blue', 'yellow', 'cyan', 'magenta']
order = ['first', 'second', 'third', 'fourth']
rounds = 12

game = Game.new(colors, rounds)
cpu = CPU.new(colors)
player = Player.new

while !game.game_over?
  guess = []
  while guess.length != order.length
    puts
    puts "Which of the six colors would you guess to be the #{order[guess.length]} color?"
    puts
    puts '0 - red'
    puts '1 - green'
    puts '2 - blue'
    puts '3 - yellow'
    puts '4 - cyan'
    puts '5 - magenta'
    puts
    num = gets.chomp
    puts
    guess.push(num)
  end
  color_guess = game.guess_num_to_color(guess)
  puts "Guess: #{color_guess[0]}, #{color_guess[1]}, #{color_guess[2]}, #{color_guess[3]}", ''
  message = game.compare_code_to_guess(cpu.code, color_guess)
  puts message
  puts '',game.end_game,'' if message == 'White: 0, Red: 4'
  game.next_round
end

puts '','The CPU has out smarted us!',''
