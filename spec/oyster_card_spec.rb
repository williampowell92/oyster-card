require 'oyster_card'

describe OysterCard do
  let(:max_balance) { described_class::MAX_BALANCE }

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

    it 'throws an error when trying to top up above limit' do
      expect { subject.top_up(max_balance + 1) }.to raise_error("Exceeded maximum balance of £#{max_balance / 100}")
    end

    it 'does not throw an error when topping up to the max balance' do
      expect { subject.top_up(max_balance) }.not_to raise_error
    end
  end
end
