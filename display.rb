module Display
  def display_intro
    puts "Let's play Mastermind!"
    puts 'Do you know how to play? (y/n)'
  end

  def display_instructions
    puts 'A secret number is chosen'
    puts 'The guessers try to...  guess the secret number'
    puts 'Guessers will get hints after each guess'
    puts 'You have 12 chances to guess the right number!'
  end

  def ask_include_computer
    puts 'Do you want to include a computer player? (y/n)'
  end

  def ask_number_humans
    puts 'How many humans will be playing?'
  end

  def humans_error
    puts 'Invalid input. Enter a number greater than 0.'
  end

  def ask_name(number)
    puts "What is player #{number}'s name?"
  end

  def display_players(players)
    players.each do |player|
      puts "Player #{player.number}: #{player.name}"
    end
    puts "Total players: #{players.length}"
  end

  def secret_chosen
    puts 'The secret number has been chosen!'
  end

  def ask_mastermind
    puts 'Which player will be the mastermind (picking the secret number)?'
  end

  def ask_secret_number
    puts 'Pick a secret number with 4 digits.'
  end

  def ask_guess(name)
    puts "It's #{name}'s turn."
    puts 'Take a guess!'
  end

  def display_validation(numbers, positions, remaining)
    puts "You have #{numbers} numbers correct!"
    puts "You have #{positions} numbers in the right spot!"
    puts "You have #{remaining} guesses left!"
  end

  def display_guess(guess)
    puts "The guess was #{colored(guess)}"
  end

  def colored(string)
    temp = string.chars.map do |char|
      case char
      when '1'
        char.bg_red
      when '2'
        char.bg_blue
      when '3'
        char.bg_brown
      when '4'
        char.bg_green
      when '5'
        char.bg_magenta
      when '6'
        char.bg_gray
      when '7'
        char.bg_cyan
      else
        char
      end
    end
    temp.join('')
  end

  def display_congratulations
    puts 'You won!'
  end

  def display_gameover
    puts 'You ran out of guesses!'
<<<<<<< Updated upstream
=======
    puts "The secret number was #{colored(secret)}"
>>>>>>> Stashed changes
  end

  def invalid_player_number(total_players)
    puts "Enter a number between 1 and #{total_players}."
  end

  def invalid_secret_number
    puts 'Invalid number!  Must be: ####'
  end
end
