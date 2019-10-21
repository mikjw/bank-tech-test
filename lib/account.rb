class Account

  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
  end 

  def make_withdrawal(amount)
    @balance = 75
  end 
end
