def add(numbers)
  numbers
    .split(',')
    .map(&:to_i)
    .reduce 0, :+
end

if $0 == __FILE__
  DATA.each_line do |line|
    input, expected_output = line.strip.split(';')
    unless add(input) == expected_output.to_i
      raise "Expected add(#{input}) to equal #{expected_output}"
    end
  end
  puts "All passed!"
end

__END__
;0
1;1
1,2;3
1,2,5;8
10,2,5;17
