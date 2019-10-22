class Log
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def store_transaction(type, amount, balance)
    @date = Date.new
    @transactions << {:date => @date, :type => type, :amount => amount, :balance => format_balance(balance)}
  end 

  def print_statement
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:amount]} || || #{transaction[:balance]}"
    end
  end

  private 

  def format_balance(balance)
    "#{balance}.00"
  end
end 
