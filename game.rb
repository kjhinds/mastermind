require_relative 'display'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

class Game
  include Display

  def initialize
    @board = Board.new
    @players = []
    @current_turn = 0
  end

  def play
    introduction
    game_setup
    turns
    conclusion
  end

  private

  def conclusion
    @board.secret_found? ? display_congratulations : display_gameover
  end

  def turns
    current_player = @players[@current_turn]
    make_guess(current_player.name) unless current_player == who_is_mastermind
    return if @board.secret_found? || @board.guesses_left.zero?

    @current_turn == @players.length - 1 ? @current_turn = 0 : @current_turn += 1
    turns
  end

  def make_guess(name)
    ask_guess(name)
    guess = gets.chomp
    if valid_secret_number?(guess)
      numbers, positions, remaining = @board.check_guess(guess)
      display_validation(numbers, positions, remaining)
    else
      invalid_secret_number
      make_guess(name)
    end
  end

  def introduction
    display_intro
    display_instructions if gets.chomp.downcase == 'n'
  end

  def game_setup
    human_player_setup
    computer_player_setup
    display_players(@players)
    pick_mastermind
    pick_secret_number
  end

  def human_player_setup
    ask_number_humans
    response = total_players
    @players.push(create_player(@players.length + 1)) until @players.length == response
  end

  def computer_player_setup
    if @players.length > 1
      ask_include_computer
      @players.push(create_player(@players.length + 1, computer: true)) if gets.chomp.downcase == 'y'
    else
      @players.push(create_player(@players.length + 1, computer: true))
    end
  end

  def pick_mastermind
    ask_mastermind
    response = gets.chomp.to_i
    if response.between?(1, @players.length)
      Player.mastermind = response
    else
      invalid_player_number(@players.length)
      pick_mastermind
    end
  end

  def pick_secret_number
    if who_is_mastermind.computer
      @board.secret = "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}"
    else
      player_pick_secret
    end
  end

  def who_is_mastermind
    @players[Player.mastermind - 1]
  end

  def player_pick_secret
    ask_secret_number
    response = gets.chomp
    if valid_secret_number?(response)
      @board.secret = response
    else
      invalid_secret_number
      player_pick_secret
    end
  end

  def valid_secret_number?(string)
    string.length == 4 && string.chars.all? { |c| c.match?(/[[:digit:]]/) }
  end

  def total_players
    response = gets.chomp.to_i
    return response if response.positive?

    humans_error
    total_players
  end

  def create_player(number, computer: false)
    if computer
      Player.new('Computer', number, computer)
    else
      ask_name(number)
      response = gets.chomp
      Player.new(response, number, computer)
    end
  end
end
