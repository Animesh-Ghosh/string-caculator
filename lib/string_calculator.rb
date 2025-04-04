require 'strscan'

def add(numbers)
  delimiter = ','
  if (match = numbers.match(%r{\A//(?<delimiters>\W+)\n}))
    delimiters = match[:delimiters]
    # either delimiter is within '[]' or it is without
    delimiter = if delimiters.match?(/\[\W+\]/)
                  collect_delimiters delimiters
                else
                  delimiters
                end
  end
  numbers = numbers.split(/[#{delimiter}\n]/)
                   .map(&:to_i)
  negative_numbers = numbers.filter(&:negative?)
  raise "negative numbers not allowed #{negative_numbers.join(",")}" if negative_numbers.any?

  numbers.reject { |n| n > 1000 }
         .reduce 0, :+
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
