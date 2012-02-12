require 'rubygems'
require 'bundler/setup'

require 'rubygame'

class Alien
  def initialize
    @surface = Rubygame::Surface.load("image/alien.png")
    @x = 10
    @y = 10
  end

  def blit(screen)
    @surface.blit(screen,[@x, @y])
  end
  
end

Rubygame.init
screen = Rubygame::Screen.new [640,480]
queue = Rubygame::EventQueue.new

screen.fill [255,255,0]
screen.update

alien = Alien.new
alien.blit(screen)
screen.update

loop do
  queue.each do |event|
    if event.class == Rubygame::QuitEvent
      Rubygame.quit
      exit
    end
  end
end
