class Journey
  MINIMUM_FARE = 100
  PENALTY_FARE = 600

  attr_reader :entry_station, :exit_station

  def initialize
    @complete = false
  end

  def complete?
    @complete
  end

  def incomplete?
    !@complete
  end

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
    complete_journey
  end

  def fare
    return PENALTY_FARE if no_exit_station? || no_entry_station?
    MINIMUM_FARE
  end

  private

  def complete_journey
    @complete = true
  end

  def no_exit_station?
    @exit_station.nil?
  end

  def no_entry_station?
    @entry_station.nil?
  end
end
