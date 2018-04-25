require 'journey'

class OysterCard
  MAX_BALANCE = 9000
  MINIMUM_FARE = 100

  attr_reader :balance, :journeys, :current_journey

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(value)
    raise "Exceeded maximum balance of £#{MAX_BALANCE / 100}" \
    if exceeds_balance?(value)
    raise 'Top up value must be positive' if value.negative?
    @balance += value
  end

  def touch_in(station)
    deduce(@current_journey.fare) if @current_journey.incomplete?
    raise 'Insufficient funds' if insufficient_funds?
    @current_journey = Journey.new
    @current_journey = current_journey
    @current_journey.start(station)
  end

  def touch_out(station)
    @current_journey.end(station)
    deduct(@current_journey.fare)
    save_journey
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

  def save_journey
    @journeys.push(@current_journey)
  end
end

=begin

4. How to handle currency, pounds and pennies.
5. double touching in
6. double touching out

=end
