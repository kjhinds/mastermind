class Player
  attr_reader :name, :number, :mastermind

  def initialize(name, number)
    @name = name
    @number = number
    @mastermind = false
  end

  def set_mastermind
    @mastermind = true
  end
end
