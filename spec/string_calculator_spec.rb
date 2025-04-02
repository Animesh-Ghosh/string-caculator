RSpec.describe '#add' do
  it 'returns 0 for an empty string' do
    expect(add('')).to eq 0
  end

  it 'returns 1 for "1"' do
    expect(add('1')).to eq 1
  end

  it 'returns 3 for "1,2"' do
    expect(add('1,2')).to eq 3
  end

  it 'returns 8 for "1,2,5"' do
    expect(add('1,2,5')).to eq 8
  end

  it 'returns 17 for "10,2,5"' do
    expect(add('10,2,5')).to eq 17
  end
end
