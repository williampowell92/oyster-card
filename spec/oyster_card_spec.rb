describe OysterCard do
  let(:max_balance) { described_class::MAX_BALANCE }
  let(:minimum_fare) { described_class::MINIMUM_FARE }

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

    it 'throws an error when passed a negative value' do
      expect { subject.top_up(-1) }.to raise_error('Top up value must be positive')
    end
  end

  describe '#in_journey?' do
    it 'initializes to false' do
      expect(subject.in_journey?).to be false
    end
  end

  describe '#touch_in' do
    context 'with sufficient funds' do
      it 'changes in_journey? to true' do
        subject.top_up(minimum_fare)
        subject.touch_in
        expect(subject).to be_in_journey
      end
    end

    context 'with insufficient funds' do
      it 'throws an error if the card has insufficient balance' do
        expect { subject.touch_in }.to raise_error 'Insufficient funds'
      end
    end
  end

  describe '#touch_out' do
    it 'changes in_journey? to false' do
      subject.top_up(minimum_fare)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts a fare' do
      subject.top_up(minimum_fare)
      subject.touch_in
      expect { subject.touch_out }.to change{ subject.balance }.by(-minimum_fare)
    end
  end
end
