require "spec_helper"

describe 'routing' do
  #allow extra whitespace
  it { is_expected.to route('Lita double 2')}
  it { is_expected.to route('Lita double   22')}
  #allow mixed casing
  it {is_expected.to route('Lita doUble 4')}

  #ignore numbers that don't look like integers
  it { is_expected.to_not route('Lita double two')}
  it { is_expected.to_not route('Lita double 1e4')}
end

describe ':double_number' do
  let(:n) { rand(1..100)}

  it 'returns double the input' do
    actual = subject.double_number n
    expected = n*2

    expect(actual).to eq(expected)
  end

  it 'doubles numbers when asked to' do
    send_message 'Lita double 2'
    expect(replies.last).to eq('2 + 2 = 4')
  end    
end
