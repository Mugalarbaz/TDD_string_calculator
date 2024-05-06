class StringCalculator
  def initialize
  end

  def int_add(string_of_numbers)
    raise 'only accepts a string' unless string_of_numbers.is_a?(String)
    string_array = string_of_numbers.split(/[^0-9-]+/)
    integer_array = string_array.map(&:to_i)
    raise "cannot accept negatives - #{check_for_negatives(integer_array)}" if check_for_negatives(integer_array)
    integer_array.inject(0) { |sum, x| x <= 1000 ? sum + x : sum }
  end

  def check_for_negatives(integer_array)
    negatives_array = integer_array.select { |i| i < 0 }
    if negatives_array.length > 0
      negatives_string = negatives_array.join(",")
      return negatives_string
    else
      return false
    end
  end
end
