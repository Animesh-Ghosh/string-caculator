require 'strscan'

def add(numbers)
  s = StringScanner.new numbers
  regexp = %r{
  //
  ( # either delimiter is within '[]'
   \[
     (?<delim>\W+)
   \]
   | # or it is without
   (?<delim>\W)
  )
  \n
  }x
  s.scan_until regexp
  delim = s[:delim] || ','
  numbers = numbers.split(/[#{delim}\n]/)
                   .map(&:to_i)
  negative_numbers = numbers.filter(&:negative?)
  raise "negative numbers not allowed #{negative_numbers.join(",")}" if negative_numbers.any?

  numbers
    .reject { |n| n > 1000 }
    .reduce 0, :+
end
