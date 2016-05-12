require_relative 'tile'

class Gamefield
  
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    @columns = []
    
    @size_y.times do
      row = Array.new
      @size_x.times do
        row << Tile.new
      end
      @columns << row
    end
  end
  
  def set_coord(object)
    @columns[object.y][object.x] << object
  end
  
  def draw
    wipe_screen
    @columns.each do |row|
      row.each { |tile| print tile.render }
      puts
    end
  end
  
  def update
    @columns.each do |row|
      row.each { |tile| tile.resolve_collisions }
    end
  end
  
  def clear_tiles
    @columns.each do |row|
      row.each { |tile| tile.clear }
    end
  end
  
  private
  
    def wipe_screen
      #print "\e[2J\e[f"
	  system('cls')
    end
end