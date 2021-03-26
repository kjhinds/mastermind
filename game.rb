require_relative 'display'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

class Game
  include Display

  def initialize
    @board = Board.new
    @players = []
  end

  def play
    introduction
    game_setup
    turns
  end

  private

  def turns
    
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
      @players[response - 1].set_mastermind
    else
      invalid_player_number(@players)
      pick_mastermind
    end
  end

  def pick_secret_number

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
      Player.new(response, number)
    end
  end
end
