class Player
  attr_reader :name, :number, :computer

  @mastermind = 0

  class << self
    attr_accessor :mastermind
  end

  def initialize(name, number, computer)
    @name = name
    @number = number
    @computer = computer
  end

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
    response = gets.chomp
    if valid_secret_number?(response)
      response
    else
      invalid_secret_number
      pick_secret
    end
  end

  def valid_secret_number?(string)
    string.length == 4 && string.chars.all? { |c| c.match?(/[[:digit:]]/) }
  end

  def ask_guess
    puts "It's #{@name}'s turn."
    puts 'Take a guess!'
  end

  def ask_secret_number
    puts 'Pick a secret number with 4 digits.'
  end

  def invalid_secret_number
    puts 'Invalid number!  Must be: ####'
  end
end
