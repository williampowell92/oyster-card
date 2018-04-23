require 'oyster_card'

describe OysterCard do
  describe '#initialize' do
    it 'tests a new oyster card has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up a card' do
      top_up_value = 500
      subject.top_up(top_up_value)
      expect(subject.balance).to eq top_up_value
    end
  end
end
