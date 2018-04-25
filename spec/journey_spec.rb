describe Journey do
  let(:station) { instance_double Station }
  describe '#initialize' do

    it 'initializes incomplete' do
      expect(subject).not_to be_complete
    end
  end

  describe '#start' do
    it 'sets the entry station' do
      subject.start(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe '#end' do
    before { subject.end(station) }
    it 'sets the exit station' do
      expect(subject.exit_station).to eq(station)
    end

    it 'completes a journey' do
      expect(subject).to be_complete
    end
  end

  describe '#entry_station' do
    it 'initializes with an empty entry station' do
      expect(subject.entry_station).to be_nil
    end

  end

  describe '#exit_station' do
    it 'creates an empty exit station' do
      expect(subject.exit_station).to be_nil
    end
  end

  describe '#fare' do
    context 'entry and exit station exist' do
      
    end
  end
end
