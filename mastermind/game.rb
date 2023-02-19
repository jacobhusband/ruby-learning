class Game
  attr_reader :round, :rounds

  def initialize(colors, rounds)
    @round = 0
    @rounds = rounds
    @colors = colors
  end

  def next_round
    @round += 1
  end

  def game_over?
    @round == @rounds
  end

  def guess_num_to_color(guess)
    new_guess = []
    guess.each do |num|
      new_guess.push(@colors[num.to_i])
    end
    new_guess
  end

  def compare_code_to_guess(code, guess)
    white = 0
    red = 0
    code_hash = Hash.new(0)
    code.each do |color|
      code_hash[color] += 1
    end
    guess.each do |color|
      if code_hash[color] > 0
        code_hash[color] -= 1
        white += 1
      end
    end
    code.each_with_index do |color, ind|
      if color == guess[ind]
        red += 1
        white -= 1
      end
    end
    "White: #{white}, Red: #{red}"
  end

  def end_game
    @round = 11
    "Congradulations you have beat the cpu!"
  end
end
