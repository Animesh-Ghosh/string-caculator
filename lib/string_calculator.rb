require 'strscan'

def add(numbers)
  s = StringScanner.new numbers
  s.scan_until %r{//(?<delim>\W)\n}
  delim = s[:delim] || ','
  numbers = numbers.split(/[#{delim}\n]/)
                   .map(&:to_i)
  if numbers.any?(&:negative?)
    negative_numbers = numbers.filter(&:negative?)
                              .join ','
    raise "negative numbers not allowed #{negative_numbers}"
  end

  numbers.reduce 0, :+
end
