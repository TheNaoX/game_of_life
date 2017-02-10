require_relative './grid.rb'

class Player
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def play
    iterate do |cell, x, y|
      transform(cell, x, y)
    end
  end

  def draw
    grid.draw
  end

  private

  def transform(cell, x, y)
    neighbours = grid.neighbors_for(x, y)

    alive = neighbours.select { |n| n.alive?  }
    dead  = neighbours.select { |n| !n.alive? }

    if cell.alive? and alive.count < 2
      cell.kill!
    elsif cell.alive? and alive.count == 2 or alive.count == 3
      cell.revive!
    elsif cell.alive? and alive.count > 3
      cell.kill!
    elsif not cell.alive? and alive.count == 3
      cell.revive!
    end
  end

  def iterate
    grid.grid.each_with_index do |rows, x|
      rows.each_with_index do |cell, y|
        yield(cell, x, y)
      end
    end
  end
end
