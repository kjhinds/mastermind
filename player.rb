class Player
  attr_reader :name, :number

  @mastermind = 0

  class << self
    attr_accessor :mastermind
  end

  def initialize(name, number)
    @name = name
    @number = number
  end
end
