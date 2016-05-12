class Ticker
  attr_reader :ticker
  def initialize
    @ticker = 0
  end
  
  def tick
    if @ticker == 120
      @ticker = 0
    else
      @ticker += 1
    end
  end
end