class Account
  attr_reader :balance
  
  def initialize
    @balance = 0
    @transactions = []
  end

  def make_deposit(amount)
    @balance += amount
    @transactions << @balance
  end

  def make_withdrawal(amount)
    @balance -= amount
  end
end
