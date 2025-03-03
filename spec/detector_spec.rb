require 'spec_helper'
require_relative '../lib/pattern'
require_relative '../lib/radar'
require_relative '../lib/detector'

RSpec.describe Detector do
  let(:pattern_string) { "--o--\n-ooo-\nooooo" }
  let(:pattern) { Pattern.new(pattern_string) }
  
  describe '#find_invaders' do
    context 'with an exact match' do
      let(:radar_sample) { "-----\n--o--\n-ooo-\nooooo\n-----" }
      let(:radar) { Radar.new(radar_sample) }
      subject { described_class.new(radar, [pattern]) }
      
      it 'finds the pattern with 100% similarity' do
        results = subject.find_invaders
        expect(results.length).to eq(1)
        expect(results[0][:invader_index]).to eq(0)
        expect(results[0][:position]).to eq({ row: 1, col: 0 })
        expect(results[0][:similarity]).to eq(1.0)
      end
    end
    
    context 'with a partial match above threshold' do
      let(:radar_sample) { "-----\n--o--\n-oo--\nooooo\n-----" }
      let(:radar) { Radar.new(radar_sample) }
      subject { described_class.new(radar, [pattern]) }
      
      it 'finds the pattern with similarity above threshold' do
        results = subject.find_invaders
        expect(results.length).to eq(1)
        expect(results[0][:similarity]).to be >= Detector::SIMILARITY_THRESHOLD
        expect(results[0][:similarity]).to be < 1.0
      end
    end
    
    context 'with a partial match below threshold' do
      let(:radar_sample) { "-----\n-----\n-----\no----\n-----" }
      let(:radar) { Radar.new(radar_sample) }
      subject { described_class.new(radar, [pattern]) }
      
      it 'does not find any patterns' do
        results = subject.find_invaders
        expect(results).to be_empty
      end
    end
    
    context 'with multiple matches' do
      let(:radar_sample) { "--o-----o--\n-ooo---ooo-\nooooo-ooooo" }
      let(:radar) { Radar.new(radar_sample) }
      subject { described_class.new(radar, [pattern]) }
      
      it 'finds all patterns' do
        results = subject.find_invaders
        expect(results.length).to eq(2)
        expect(results[0][:position]).to eq({ row: 0, col: 0 })
        expect(results[1][:position]).to eq({ row: 0, col: 6 })
      end
    end
    
    context 'with edge case at boundaries' do
      let(:radar_sample) { "--o--\n-ooo-\nooooo" }
      let(:radar) { Radar.new(radar_sample) }
      subject { described_class.new(radar, [pattern]) }
      
      it 'finds the pattern at the boundary' do
        results = subject.find_invaders
        expect(results.length).to eq(1)
        expect(results[0][:position]).to eq({ row: 0, col: 0 })
        expect(results[0][:similarity]).to eq(1.0)
      end
    end
  end
end