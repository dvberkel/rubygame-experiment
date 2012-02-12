require 'rubygems'
require 'bundler/setup'

require 'rubygame'

Rubygame.init
screen = Rubygame::Screen.new [640,480]
queue = Rubygame::EventQueue.new

loop do
  queue.each do |event|
    if event.class == Rubygame::QuitEvent
      Rubygame.quit
      exit
    end
  end
end
