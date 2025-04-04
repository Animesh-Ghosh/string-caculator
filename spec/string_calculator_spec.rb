require 'string_calculator'

RSpec.describe '#add' do
  it 'adds upto 2 numbers separated by commas' do
    expect(add('')).to eq 0
    expect(add('1')).to eq 1
    expect(add('1,2')).to eq 3
  end

  it 'adds more than 2 numbers separated by commas' do
    expect(add('1,2,5')).to eq 8
    expect(add('10,2,5')).to eq 17
  end

  it 'handles new lines between numbers instead of commas' do
    expect(add("1\n2,3")).to eq 6
  end

  it 'supports different delimiters' do
    expect(add("//;\n1;2")).to eq 3
    expect(add("//*\n1\n2*3")).to eq 6
  end

  it 'raises an exception if negative numbers are passed' do
    expect do
      add("1\n2,-3,4,-5")
    end.to raise_error 'negative numbers not allowed -3,-5'
  end

  it 'ignores adding numbers greater than 1000' do
    expect(add("2,1001")).to eq 2
  end

  it 'supports delimiters of any length' do
    expect(add("//[***]\n1***2***3")).to eq 6
  end

  it 'allows multiple delimiters' do
    expect(add("//[*][%]\n1*2%3")).to eq 6
  end

  it 'handles multiple delimiters of varying lengths' do
    expect(add("//[***][%]\n1***2%3")).to eq 6
  end
end
