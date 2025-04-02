def add(numbers)
  numbers
    .split(%r{[,\n]})
    .map(&:to_i)
    .reduce 0, :+
end
