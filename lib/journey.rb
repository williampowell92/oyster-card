class Journey
  attr_reader :entry_station, :exit_station

  def initialize
    @complete = false
  end

  def complete?
    @complete
  end

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
    complete_journey
  end

  private
  def complete_journey
    @complete = true
  end
end
