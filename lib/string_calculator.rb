require 'strscan'

def add(numbers)
  if numbers.match(%r{\A//\W+\n})
    s = StringScanner.new numbers
    # either delimiter is within '[]' or it is without
    regexp = %r{
    //
    (
     \[
       (?<delimiter>\W+)
     \]
     |
     (?<delimiter>\W)
    )
    \n
    }x
    s.scan_until regexp
    delimiter = s[:delimiter]
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
