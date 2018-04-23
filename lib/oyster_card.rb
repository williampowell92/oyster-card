class OysterCard
  MAX_BALANCE = 9000
  MINIMUM_FARE = 100
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Exceeded maximum balance of £#{MAX_BALANCE / 100}"  if exceeds_balance?(value)
    raise 'Top up value must be positive' if value.negative?
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Insufficient funds' if insufficient_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
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
end

=begin

4. How to handle currency, pounds and pennies.
5. double touching in
6. double touching out

=end
