require_relative './cell.rb'
require_relative './grid.rb'
require_relative './player.rb'

grid = Grid.new(10, 10, Cell)
player = Player.new(grid)

loop do
  player.draw
  player.play
  sleep 1
  system "clear"
end
