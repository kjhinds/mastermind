require 'io/console'

class Human < Player
  def make_guess
    ask_guess
    guess = gets.chomp
    if valid_secret_number?(guess)
      guess
    else
      invalid_secret_number
      make_guess
    end
  end

  def pick_secret
    ask_secret_number
    response = $stdin.noecho(&:gets).chomp
    if valid_secret_number?(response)
      response
    else
      invalid_secret_number
      pick_secret
    end
  end

  def valid_secret_number?(string)
    string.length == 4 && string.chars.all? { |c| c.match?(/[1-8]/) }
  end

  def ask_guess
    puts "It's #{@name}'s turn."
    puts 'Take a guess!'
  end

  def ask_secret_number
    puts 'Pick a secret number with 4 digits using numbers 1 - 8 (Code will be hidden).'
  end

  def invalid_secret_number
    puts 'Invalid number!  Must be: ####  Do not include 0s or 9s.'
  end
end
