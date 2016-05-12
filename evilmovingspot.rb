class EvilMovingSpot
  attr_accessor :x, :y, :avatar, :type, :alive
  def initialize(x, y, field_size_x, field_size_y)
    @fertility = rand(0)
    @x = x
    @y = y
    @field_size_x = field_size_x
    @field_size_y = field_size_y
    @avatar = 'O'
    @type = 'carnivore'
    @alive = true
  end
  
  def update(ticker)
    if ticker % 1 == 0
      move_x(rand(2) - rand(2))
    end
    
    if ticker % 2 == 0
      move_y(rand(2) - rand(2))
    end
  end
  
  def move_x(x)
    @x += x
    @x = @x % @field_size_x
  end
  
  def move_y(y)
    @y += y
    @y = @y % @field_size_y
  end
  
  def spawn
    if @fertility > rand(100)
      return EvilMovingSpot.new(rand(@field_size_x), rand(@field_size_y), @field_size_x, @field_size_y)
    end
  end
  
  def to_s
    avatar
  end
end