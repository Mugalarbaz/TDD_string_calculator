require_relative '../../app/string_calculator'
RSpec.describe StringCalculator do
  describe '#int_add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.int_add('')).to eq(0)
    end

    it 'returns the number itself for a single number string' do
      calculator = StringCalculator.new
      expect(calculator.int_add('5')).to eq(5)
    end

    it 'returns the sum of two numbers in the string' do
      calculator = StringCalculator.new
      expect(calculator.int_add('2,3')).to eq(5)
    end

    it 'returns the sum of multiple numbers in the string' do
      calculator = StringCalculator.new
      expect(calculator.int_add('2,3,5,10')).to eq(20)
    end

    it 'ignores numbers greater than 1000' do
      calculator = StringCalculator.new
      expect(calculator.int_add('2,1001,5')).to eq(7)
    end

    it 'raises an error for negative numbers and lists the negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.int_add('2,-3,5,-10') }.to raise_error(RuntimeError, 'cannot accept negatives - -3,-10')
    end
  end
end