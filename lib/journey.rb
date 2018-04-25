class Journey
  attr_reader :entry_station, :exit_station

  def initialize
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def start_journey
    @in_journey = true
  end
end
