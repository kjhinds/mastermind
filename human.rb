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
    response = gets.chomp
    if valid_secret_number?(response)
      response
    else
      invalid_secret_number
      pick_secret
    end
  end
end
