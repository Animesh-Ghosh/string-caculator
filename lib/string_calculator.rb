require 'strscan'

def add(numbers)
  s = StringScanner.new numbers
  s.scan_until %r{//(?<delim>\W)\n}
  delim = s[:delim] || ','
  numbers = numbers.split(/[#{delim}\n]/)
                   .map(&:to_i)
  negative_numbers = numbers.filter(&:negative?)
  raise "negative numbers not allowed #{negative_numbers.join(",")}" if negative_numbers.any?

  numbers
    .reject { |n| n > 1000 }
    .reduce 0, :+
end
