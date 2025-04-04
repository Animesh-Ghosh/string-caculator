require 'strscan'

def add(numbers)
  if (match = numbers.match(%r{\A//(?<delimiters>\W+)\n}))
    delimiters = match[:delimiters]
    # either delimiter is within '[]' or it is without
    if delimiters.match?(/\[\W+\]/)
      s = StringScanner.new delimiters
      delimiters = ''
      until s.eos?
        s.scan(/\[/)
        s.scan(/(?<delimiter>[^\]]+)/)
        delimiters << s[:delimiter]
        s.scan(/\]/)
      end
      delimiter = delimiters
    else
      delimiter = delimiters
    end
  else
    delimiter = ','
  end
  numbers = numbers.split(/[#{delimiter}\n]/)
                   .map(&:to_i)
  negative_numbers = numbers.filter(&:negative?)
  raise "negative numbers not allowed #{negative_numbers.join(",")}" if negative_numbers.any?

  numbers
    .reject { |n| n > 1000 }
    .reduce 0, :+
end
