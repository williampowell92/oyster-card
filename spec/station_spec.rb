describe Station, :station do
  describe '#initialize' do
    let(:name) { 'Aldgate East' }
    let(:zone) { 1 }
    let(:station) { Station.new(name) }

    it 'initializes with a name' do
      expect(station.name).to eq name
    end

    it 'initializes with a zone' do
      expect(station.zone).to eq 1
    end
  end
end
