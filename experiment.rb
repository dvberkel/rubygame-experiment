require 'rubygems'
require 'bundler/setup'

require 'rubygame'

Rubygame.init
screen = Rubygame::Screen.new [640,480]
queue = Rubygame::EventQueue.new

screen.fill [255,255,0]
screen.update

alien = Rubygame::Surface.load("image/alien.png")
alien.blit(screen, [10,10])
screen.update

loop do
  queue.each do |event|
    if event.class == Rubygame::QuitEvent
      Rubygame.quit
      exit
    end
  end
end
