class Account
  attr_reader :balance, :log
  
  def initialize(log)
    @log = log
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
  end

  def make_withdrawal(amount)
    @balance -= amount
  end
end
