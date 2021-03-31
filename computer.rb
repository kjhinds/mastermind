class Computer < Player
  def initialize(name, number)
    super
    @possible_codes = [*'1111'..'8888']
    remove = @possible_codes.select do |code|
      code.chars.any? { |i| %w[0 9].include? i }
    end
    @possible_codes -= remove
  end

  def make_guess
    p @possible_codes.sample
  end

  def pick_secret
    @possible_codes.sample
  end

  def record_guess(guess, numbers, positions)
    @possible_codes.delete(guess)
    to_remove = @possible_codes.select do |code|
      check_numbers(code, guess, numbers)
    end
    @possible_codes -= to_remove
    to_remove = @possible_codes.select do |code|
      check_positions(code, guess, positions)
    end
    @possible_codes -= to_remove
  end

  def check_numbers(code, guess, numbers)
    count = 0
    code_array = code.chars
    guess.chars.each do |char|
      if code_array.include?(char)
        count += 1
        code_array.delete_at(code_array.index(char))
      end
    end
    count != numbers
  end

  def check_positions(code, guess, positions)
    count = 0
    guess.chars.each_with_index do |char, index|
      count += 1 if char == code.chars[index]
    end
    count != positions
  end
end
