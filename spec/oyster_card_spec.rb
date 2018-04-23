require 'oyster_card'

describe OysterCard do
  describe '#initialize' do
    it 'tests a new oyster card has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
end
