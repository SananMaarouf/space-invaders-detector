class Radar
  attr_reader :grid, :height, :width

  def initialize(radar_sample)
    @grid = parse_radar(radar_sample)
    @height = @grid.length
    @width = @grid[0].length
  end

  # Returns the character at the specified position, or nil if out of bounds
  def at(row, col)
    return nil if row < 0 || row >= @height || col < 0 || col >= @width
    @grid[row][col]
  end

  private

  def parse_radar(radar_sample)
    radar_sample.strip.split("\n").map { |line| line.chars }
  end
end