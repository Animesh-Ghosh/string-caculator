require 'strscan'

def add(numbers)
  s = StringScanner.new numbers
  s.scan_until(%r[//(?<delim>\W)\n])
  delim = s[:delim] || ','
  numbers = numbers.split(%r{[#{delim}\n]})
                   .map(&:to_i)
  if numbers.any? { |n| n.negative? }
    negative_numbers = numbers.filter { |n| n.negative? }
                              .join(',')
    raise "negative numbers not allowed #{negative_numbers}"
  end

  numbers.reduce 0, :+
end
