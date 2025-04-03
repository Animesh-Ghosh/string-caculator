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

  it 'handle new lines between numbers instead of commas' do
    expect(add("1\n2,3")).to eq 6
  end

  it 'supports different delimiters' do
    expect(add("//;\n1;2")).to eq 3
  end
end
