require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new(input: '')
      expect(calculator.add).to eq(0)
    end

    it 'returns the number for a single number' do
      calculator = StringCalculator.new(input: '1')
      expect(calculator.add).to eq(1)
    end

    it 'returns the sum of two numbers' do
      calculator = StringCalculator.new(input: '1,5')
      expect(calculator.add).to eq(6)
    end

    it 'returns the sum of numbers separated by commas and new lines' do
      calculator = StringCalculator.new(input: "1\n2,3")
      expect(calculator.add).to eq(6)
    end

    it 'returns the sum with a custom delimiter' do
      calculator = StringCalculator.new(input: "//;\n1;2")
      expect(calculator.add).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      calculator = StringCalculator.new(input: '1,-2,3,-4')
      expect { calculator.add }.to raise_error(ArgumentError, 'Negative numbers not allowed: -2, -4')
    end
  end
end
