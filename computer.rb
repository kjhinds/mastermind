class Computer < Player
  def computer
    true
  end

  def make_guess
    '1111'
  end

  def pick_secret
    "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}"
  end
end
