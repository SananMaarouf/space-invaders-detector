require_relative 'pattern'
require_relative 'radar'
require_relative 'detector'

class SpaceInvadersDetector
  attr_reader :known_invaders, :radar

  def initialize(known_invaders_patterns)
    @known_invaders = known_invaders_patterns.map { |pattern| Pattern.new(pattern) }
  end

  def detect(radar_sample)
    @radar = Radar.new(radar_sample)
    detector = Detector.new(@radar, @known_invaders)
    detector.find_invaders
  end
  
  def print_detection_results(results)
    puts "Detected #{results.length} potential invader locations:"
    
    results.each_with_index do |result, index|
      invader_type = result[:invader_index]
      position = result[:position]
      similarity = result[:similarity]
      
      puts "#{index + 1}. Invader type #{invader_type + 1} at position (#{position[:row]}, #{position[:col]}) with #{(similarity * 100).round(2)}% similarity"
    end
    
    if results.empty?
      puts "No invaders detected in the radar sample."
    end
  end
end