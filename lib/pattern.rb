class Pattern
  attr_reader :grid, :height, :width

  def initialize(pattern_string)
    @grid = parse_pattern(pattern_string)
    @height = @grid.length
    @width = @grid[0].length
  end

  # Returns the character at the specified position, or nil if out of bounds
  def at(row, col)
    return nil if row < 0 || row >= @height || col < 0 || col >= @width
    @grid[row][col]
  end

  private

  def parse_pattern(pattern_string)
    pattern_string.strip.split("\n").map { |line| line.chars }
  end
end