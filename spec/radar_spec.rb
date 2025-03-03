require 'spec_helper'
require_relative '../lib/radar'

RSpec.describe Radar do
  let(:radar_sample) { "--o--\n-ooo-\nooooo" }
  subject { described_class.new(radar_sample) }

  describe '#initialize' do
    it 'correctly parses the radar sample' do
      expect(subject.grid).to eq([
        ['-', '-', 'o', '-', '-'],
        ['-', 'o', 'o', 'o', '-'],
        ['o', 'o', 'o', 'o', 'o']
      ])
    end
    
    it 'sets the correct dimensions' do
      expect(subject.height).to eq(3)
      expect(subject.width).to eq(5)
    end
  end

  describe '#at' do
    it 'returns the character at valid positions' do
      expect(subject.at(0, 2)).to eq('o')
      expect(subject.at(1, 1)).to eq('o')
      expect(subject.at(2, 0)).to eq('o')
    end
    
    it 'returns nil for invalid positions' do
      expect(subject.at(-1, 0)).to be_nil
      expect(subject.at(0, -1)).to be_nil
      expect(subject.at(3, 0)).to be_nil
      expect(subject.at(0, 5)).to be_nil
    end
  end
end