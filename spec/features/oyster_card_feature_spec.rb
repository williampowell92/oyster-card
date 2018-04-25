require 'spec_helper'

feature 'London Underground' do
  let(:station_1) {Station.new('Aldgate East')}
  let(:station_2) {Station.new('Euston')}
  let(:oyster_card) {Oystercard.new}
  PENALTY_FARE = 6000

  scenario 'not touching out' do
    oyster_card.top_up(PENALTY_FARE)
    oyster_card.touch_in(station_1)
    oyster_card.touch_in(station_2)
    expect(oyster_card.balance).to eq(0)
    expect(oyster_card.current_journey).to eq({entry_station: station_2})
    expect(oyster_card.journeys).to include({entry_station: station_1})
  end 

end
