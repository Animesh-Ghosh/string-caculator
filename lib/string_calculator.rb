require 'strscan'

class StringCalculator
  def initialize(numbers) = (@numbers = numbers)

  class NegativeNumbersError < StandardError
    def initialize(numbers)
      super("negative numbers not allowed #{numbers.join(",")}")
    end
  end

  def add
    numbers = @numbers.split(/[#{delimiter}\n]/)
                      .map(&:to_i)
    negative_numbers = numbers.filter(&:negative?)
    raise NegativeNumbersError, negative_numbers if negative_numbers.any?

    numbers.reject { |n| n > 1000 }
           .reduce 0, :+
  end

  private

  def delimiter
    delimiter = ','
    if (match = @numbers.match(%r{\A//(?<delimiters>\W+)\n}))
      delimiters = match[:delimiters]
      # either delimiter is within '[]' or it is without
      delimiter = if delimiters.match?(/\[\W+\]/)
                    collect_delimiters delimiters
                  else
                    delimiters
                  end
    end
    delimiter
  end

  def collect_delimiters(delimiters)
    s = StringScanner.new delimiters
    delimiters = ''
    until s.eos?
      s.scan(/\[/)
      s.scan(/(?<delimiter>[^\]]+)/)
      delimiters << s[:delimiter]
      s.scan(/\]/)
    end
    delimiters
  end
end

def add(numbers)
  StringCalculator.new(numbers).add
end
