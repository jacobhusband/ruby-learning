class Player
  def initialize
    @guesses = []
  end

  def add_guess(guess)
    @guesses.push(guess)
  end

  def guess_count
    @guesses.length
  end
end
