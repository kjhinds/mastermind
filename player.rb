class Player
  attr_reader :name, :number, :computer

  @mastermind = 0

  class << self
    attr_accessor :mastermind
  end

  def initialize(name, number, computer)
    @name = name
    @number = number
    @computer = computer
  end
end
