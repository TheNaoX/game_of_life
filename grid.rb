class Grid
  attr_reader :rows, :columns, :grid, :cell_klass

  def initialize(rows, columns, cell_klass)
    @rows, @columns = rows, columns

    @cell_klass = cell_klass

    @grid = generate_grid
  end

  def draw
    grid.each do |row|
      puts row.map(&:inspect).join(' ')
    end
  end

  def neighbors_for(row, column)
    neighbors = []
    (row-1..row+1).each do |i|
      (column-1..column+1).each do |j|
        unless outside_limits? i, j or himself? row, column, i, j
          neighbors << grid[i][j]
        end
      end
    end

    neighbors
  end

  private

  def generate_grid
    Array.new(rows) do
      Array.new(columns) do
        cell_klass.new
      end
    end
  end

  def outside_limits?(i, j)
    (i < 0 or j < 0) or
      (i > rows - 1 or j > columns - 1)
  end

  def himself?(row, column, i, j)
    row == i and column == j
  end
end
