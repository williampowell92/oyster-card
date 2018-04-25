describe Journey do
  describe '#initialize' do
    it 'creates an empty entry station' do
      expect(subject.entry_station).to be_nil
    end

    it 'creates an empty exit station' do
      expect(subject.exit_station).to be_nil
    end

    it 'initializes out of journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#start_journey' do
    it 'changes in journey to true' do
      subject.start_journey
      expect(subject).to be_in_journey
    end
  end
end
