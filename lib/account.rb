class Account
  attr_reader :balance
  
  def initialize
    @balance = 0
    @balances = []
  end

  def make_deposit(amount)
    @balance += amount
    @balances << @balance
  end

  def make_withdrawal(amount)
    @balance -= amount
  end

  def print_statement
    puts "balance"
    @balances.reverse.each do |balance|
      puts format_balance(balance)
    end
  end

  private 

  def format_balance(balance)
    "#{balance}.00"
  end
end
