require 'spec_helper'

feature 'London Underground' do
=begin
  let(:station_1) {Station.new('Aldgate East')}
  let(:station_2) {Station.new('Euston')}
  let(:oyster_card) {OysterCard.new}
  PENALTY_FARE = 6000

  context 'touching in twice' do
    before do
      oyster_card.top_up(PENALTY_FARE)
      oyster_card.touch_in(station_1)
      oyster_card.touch_in(station_2)
    end

    scenario 'takes a penalty fare' do
      expect(oyster_card.balance).to eq(0)
    end

    scenario 'stores latest touch in to entry station' do
      expect(oyster_card.current_journey).to eq({entry_station: station_2})
    end

    scenario 'stores the last journey without an exit station' do
      expect(oyster_card.journeys).to include({entry_station: station_1})
    end
  end
=end
end
