require_relative 'display'
require_relative 'board'
require_relative 'player'

class Game
  include Display

  def initialize
    @board = Board.new
    @players = []
  end

  def play
    game_setup
  end

  private

  def game_setup
    display_intro
    display_instructions if gets.chomp.downcase == 'n'
    ask_guessers
    response = total_players
    @players.push(create_player(@players.length + 1)) until @players.length == response
    display_players(@players)
  end

  def total_players
    loop do
      response = gets.chomp.to_i
      return response if response.positive?

      guessers_error
    end
  end

  def create_player(number)
    ask_name(number)
    response = gets.chomp
    Player.new(response, number)
  end
end
