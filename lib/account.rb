class Account
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
  end

  def make_withdrawal(amount)
    @balance -= amount
  end

  def print_statement
    puts "balance"
    puts format_balance(@balance)
  end

  private 

  def format_balance(balance)
    "#{@balance}.00"
  end
end
