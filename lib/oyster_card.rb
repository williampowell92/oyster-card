class OysterCard
  MAX_BALANCE = 9000
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Exceeded maximum balance of £#{MAX_BALANCE / 100}"  if exceeds_balance?(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def exceeds_balance?(value)
    balance + value > MAX_BALANCE
  end
end

=begin

1. Errors for topping up negative values
2. Error for deducting below zero
3. Error for deducting negative values
4. How to handle currency, pounds and pennies.

=end
