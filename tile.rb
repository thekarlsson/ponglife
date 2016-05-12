class Tile
  
  def initialize()
    @texture = ' '
    @occupants = Array.new
  end
  
  def resolve_collisions
    carnivore_exists = false
    @occupants.each do |occupant|
      if occupant.type == 'carnivore'
        carnivore_exists = true
      end
    end
    if carnivore_exists
      @occupants.each do |occupant|
        occupant.die if occupant.type == 'herbivore'
      end
    end
  end
  
  def enter(object)
    @occupants << object
  end
  
  def clear
    @occupants.clear
  end
  
  def render
    if @occupants.empty?
      return @texture
    else
      return @occupants.last
    end
  end
  
  def <<(object)
    @occupants << object
  end
  
  #def collides?(obj1, obj2)
  #  return true if [obj1.x, obj1.y] == [obj2.x, obj2.y]
  #end
end