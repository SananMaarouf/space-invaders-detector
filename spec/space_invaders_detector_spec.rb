require 'spec_helper'
require_relative '../lib/space_invaders_detector'

RSpec.describe SpaceInvadersDetector do
  let(:invader_patterns) { [
    "--o---ooo-ooooo",
    "-o-o--ooo---o--"
  ] }
  
  subject { described_class.new(invader_patterns) }
  
  describe '#initialize' do
    it 'creates Pattern objects for each invader pattern' do
      expect(subject.known_invaders.length).to eq(2)
      expect(subject.known_invaders[0]).to be_a(Pattern)
      expect(subject.known_invaders[1]).to be_a(Pattern)
    end
  end
  
  describe '#detect' do
    let(:radar_sample) { "---------o-----ooo---ooooo---------" }
    
    it 'creates a Radar object and detects invaders' do
      results = subject.detect(radar_sample)
      expect(subject.radar).to be_a(Radar)
      expect(results).to be_an(Array)
      expect(results.length).to eq(1)
      expect(results[0][:invader_index]).to eq(0)
      expect(results[0][:position]).to eq({ row: 1, col: 0 })
    end
  end
  
  describe '#print_detection_results' do
    let(:results) { [
      { invader_index: 0, position: { row: 1, col: 2 }, similarity: 0.9 },
      { invader_index: 1, position: { row: 10, col: 15 }, similarity: 0.85 }
    ] }
    
    it 'prints detection results' do
      expect { subject.print_detection_results(results) }.to output(/Detected 2 potential invader locations/).to_stdout
    end
    
    it 'handles the case with no results' do
      expect { subject.print_detection_results([]) }.to output(/No invaders detected/).to_stdout
    end
  end
end