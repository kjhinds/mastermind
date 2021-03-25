module Display
  def display_intro
    puts "Let's play Mastermind!"
    puts "Do you know how to play? (y/n)"
  end

  def display_instructions
    puts 'A secret number is chosen'
    puts 'The guessers try to...  guess the secret number'
    puts 'Guessers will get hints after each guess'
    puts 'You have 12 chances to guess the right number!'
  end

  def ask_guessers
    puts 'How many players will be guessing?'
  end

  def guessers_error
    puts 'Invalid input. Enter a number greater than 1.'
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

end
