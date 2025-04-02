def add(numbers)
  numbers
    .split(',')
    .map(&:to_i)
    .reduce 0, :+
end
