class StringCalculator < ApplicationRecord
  def add
    return 0 if input.blank?

    delimiter, numbers_string = parse_input(input)
    numbers = parse_numbers(numbers_string, delimiter)
    sum(numbers)
  end

  private

  def parse_input(input)
    delimiter = ','
    numbers_string = input

    if input.start_with?("//")
      delimiter, numbers_string = input[2..].split("\n", 2)
    end

    [delimiter, numbers_string]
  end

  def parse_numbers(numbers_string, delimiter)
    numbers_string.split(/#{delimiter}|\n/).map(&:to_i)
  end

  def sum(numbers)
    negatives = numbers.select { |num| num < 0 }

    if negatives.any?
      raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
