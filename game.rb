require_relative 'display'
require_relative 'board'
require_relative 'player'
require_relative 'computer'
require_relative 'human'

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
    @board.secret_found? ? display_congratulations : display_gameover(@board.secret)
  end

  def turns
    current_player = @players[@current_turn]
    unless current_player == who_is_mastermind
      guess = current_player.make_guess
      numbers, positions, remaining = @board.check_guess(guess)
      display_validation(numbers, positions, remaining)
      computer = @players.find { |player| player.instance_of?(Computer) }
      computer&.record_guess(guess, numbers, positions)
    end
    return if @board.secret_found? || @board.guesses_left.zero?

    @current_turn == @players.length - 1 ? @current_turn = 0 : @current_turn += 1
    turns
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
    pick_secret_number(who_is_mastermind)
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

  def pick_secret_number(player)
    @board.secret = player.pick_secret
  end

  def who_is_mastermind
    @players[Player.mastermind - 1]
  end

  def total_players
    response = gets.chomp.to_i
    return response if response.positive?

    humans_error
    total_players
  end

  def create_player(number, computer: false)
    if computer
      Computer.new('Computer', number)
    else
      ask_name(number)
      response = gets.chomp
      Human.new(response, number)
    end
  end
end
