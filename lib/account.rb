class Account
  attr_reader :balance
  
  def initialize
    @balance = 0
    @transactions = []
  end

  def make_deposit(amount)
    @balance += amount
    @transactions << {:balance => @balance}
  end

  def make_withdrawal(amount)
    @balance -= amount
  end

  def print_statement
    puts "balance"
    @transactions.reverse.each do |transaction|
      puts format_balance(transaction[:balance])
    end
  end

  private 

  def format_balance(balance)
    "#{balance}.00"
  end
end
