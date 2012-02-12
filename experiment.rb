require 'rubygems'
require 'bundler/setup'

require 'rubygame'

class Alien
  def initialize(maximumX=640, maximumY=480, dx=1, dy=1)
    @surface = Rubygame::Surface.load("image/alien.png")
    @maxX = maximumX
    @maxY = maximumY
    @dx = dx
    @dy = dy
    @x = 10
    @y = 10
  end

  def blit(screen)
    @surface.blit(screen,[@x, @y])
  end

  def move()
    @x += @dx
    @y += @dy
    if (@x < 0 || @maxX < @x)
      @dx *= -1
    end
    if (@y < 0 || @maxY < @y)
      @dy *= -1
    end
  end
end

Rubygame.init
screen = Rubygame::Screen.new [640,480]
queue = Rubygame::EventQueue.new

screen.update

alien = Alien.new

loop do
  queue.each do |event|
    if event.class == Rubygame::QuitEvent
      Rubygame.quit
      exit
    end
  end
  screen.fill [255,255,0]
  alien.move
  alien.blit(screen)
  screen.update
end
