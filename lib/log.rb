class Log
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def store_transaction(balance)
    @transactions << {:balance => format_balance(balance)}
  end 

  def print_statement
    puts "balance"
  end

  private 

  def format_balance(balance)
    "#{balance}.00"
  end
end 
