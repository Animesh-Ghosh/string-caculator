require 'strscan'

def add(numbers)
  s = StringScanner.new numbers
  s.scan_until(%r[//(?<delim>\W)\n])
  delim = s[:delim] || ','
  numbers
    .split(%r{[#{delim}\n]})
    .map(&:to_i)
    .reduce 0, :+
end
