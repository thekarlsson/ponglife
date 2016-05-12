require_relative 'gamefield'
require_relative 'evilmovingspot'
require_relative 'ticker'
require_relative 'victim'

class Pong
  def initialize
    @frames_per_sec = 4
    size_x = 42
    size_y = 11
    @default_tile = ' '
    @ticker = Ticker.new
    @gf = Gamefield.new(size_x, size_y)
    @game_objects = Array.new
    10.times do
      @game_objects << EvilMovingSpot.new(rand(size_x), rand(size_y), size_x, size_y)
      @game_objects << Victim.new(rand(size_x), rand(size_y), size_x, size_y)
    end
  end
  
  def main_loop
    loop do
      start_time = Time.now

      #game logic goes hear
      #gf.set_coord(3, 3, ' ')
      update
      spawn
      corpse_cleanup

      while Time.now - start_time <= (1.0/@frames_per_sec) do
        sleep(1.0/4) #optimization thingy
      end

      #new frame
      draw
    end
  end
  
  private
  
    def update
      @gf.clear_tiles
      @ticker.tick
      update_gamefield
    end
  
    def draw
      @gf.draw
    end
  
    def update_gamefield
      @game_objects.each do |object|
        #@gf.set_coord(object.x, object.y, @default_tile)
        object.update(@ticker.ticker)
        @gf.set_coord(object)
        @gf.update
      end
    end
    
    def corpse_cleanup
      @game_objects.each do |object|
        if object.alive == false
          @game_objects.delete(object)
        end
      end
    end
    
    def spawn
      objects_to_spawn = Array.new
      @game_objects.each do |object|
        spawnage = object.spawn
        if spawnage
          objects_to_spawn << spawnage
        end
      end
      objects_to_spawn.each { |object| @game_objects << object }
    end
    
    def eat
      
    end
end



game = Pong.new
game.main_loop