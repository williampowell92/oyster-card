describe Journey do
  describe '#initialize' do
    it 'creates an empty entry station' do
      expect(subject.entry_station).to be_nil
    end

    it 'creates an empty exit station' do
      expect(subject.exit_station).to be_nil 
    end
  end
end
