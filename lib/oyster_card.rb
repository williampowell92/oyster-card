class OysterCard
  MAX_BALANCE = 9000
  MINIMUM_FARE = 100
  attr_reader :balance, :journeys, :current_journey

  def initialize
    @balance = 0
    @journeys = []
    @current_journey = {}
  end

  def top_up(value)
    raise "Exceeded maximum balance of £#{MAX_BALANCE / 100}" if exceeds_balance?(value)
    raise 'Top up value must be positive' if value.negative?
    @balance += value
  end

  def in_journey?
    !@current_journey[:entry_station].nil?
  end

  def touch_in(station)
    raise 'Insufficient funds' if insufficient_funds?
    @in_journey = true
    save_entry_station(station)
  end

  def touch_out(station)
    @in_journey = false
    deduct(MINIMUM_FARE)
    save_exit_station(station)
    save_journey
    reset_current_journey
  end

  private

  def exceeds_balance?(value)
    balance + value > MAX_BALANCE
  end

  def insufficient_funds?
    balance < MINIMUM_FARE
  end

  def deduct(value)
    @balance -= value
  end

  def save_entry_station(station)
    @current_journey[:entry_station] = station
  end

  def save_exit_station(station)
    @current_journey[:exit_station] = station
  end

  def save_journey
    @journeys.push(@current_journey)
  end

  def reset_current_journey
    @current_journey = {}
  end
end

=begin

4. How to handle currency, pounds and pennies.
5. double touching in
6. double touching out

=end
