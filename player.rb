class Player
  attr_reader :name, :number

  @mastermind = 0

  class << self
    attr_accessor :mastermind
  end

  def initialize(name, number)
    @name = name
    @number = number
  end

  def valid_secret_number?(string)
    string.length == 4 && string.chars.all? { |c| c.match?(/[1-8]/) }
  end

  def ask_guess
    puts "It's #{@name}'s turn."
    puts 'Take a guess!'
  end

  def ask_secret_number
    puts 'Pick a secret number with 4 digits using numbers 1 - 8.'
  end

  def invalid_secret_number
    puts 'Invalid number!  Must be: ####  Do not include 0s or 9s.'
  end
end
