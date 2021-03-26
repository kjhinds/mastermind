class Board
  attr_accessor :secret, :guesses_left

  def initialize
    @secret = nil
    @current_guess = nil
    @guesses_left = 12
  end

  def secret_found?
    @secret == @current_guess
  end

  def check_guess(guess)
    @current_guess = guess
    @guesses_left -= 1
    [numbers_correct, positions_correct, @guesses_left]
  end

  def numbers_correct
    count = 0
    secret_array = @secret.chars
    @current_guess.chars.each do |char|
      if secret_array.include?(char)
        count += 1
        secret_array.delete_at(secret_array.index(char))
      end
    end
    count
  end

  def positions_correct
    count = 0
    @current_guess.chars.each_with_index do |char, index|
      count += 1 if char == @secret.chars[index]
    end
    count
  end
end
