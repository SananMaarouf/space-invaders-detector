class Detector
  # Configurable threshold for pattern matching
  SIMILARITY_THRESHOLD = 0.75 

  def initialize(radar, known_patterns)
    @radar = radar
    @known_patterns = known_patterns
    @results = []
  end

  def find_invaders
    @known_patterns.each_with_index do |pattern, pattern_index|
      # Iterate through all possible positions in the radar
      (0..@radar.height - pattern.height).each do |row|
        (0..@radar.width - pattern.width).each do |col|
          similarity = calculate_similarity(pattern, row, col)
          
          if similarity >= SIMILARITY_THRESHOLD
            @results << {
              invader_index: pattern_index,
              position: { row: row, col: col },
              similarity: similarity
            }
          end
        end
      end
    end
    
    @results
  end

  private

  def calculate_similarity(pattern, start_row, start_col)
    total_points = 0
    matching_points = 0

    (0...pattern.height).each do |row|
      (0...pattern.width).each do |col|
        pattern_char = pattern.at(row, col)
        
        # Only count positions where the pattern has an 'o' or 'O'
        if pattern_char == 'o'
          total_points += 1
          
          radar_char = @radar.at(start_row + row, start_col + col)
          if radar_char == 'o'
            matching_points += 1
          end
        end
      end
    end

    return 0 if total_points == 0
    matching_points.to_f / total_points
  end
end