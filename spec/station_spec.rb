describe Station, :station do
  describe '#initialize' do
    let(:name) { 'Aldgate East' }
    let(:station) { Station.new(name) }

    it 'initializes with a name' do
      expect(station.name).to eq name
    end

    it 'initializes with a zone' do
      expect(station.zone).to eq 1
    end

    context 'when an unknown name is given' do
      it 'raises an error' do
        expect { Station.new('Oxford') }.to raise_error('Station not found')
      end
    end
  end
end
