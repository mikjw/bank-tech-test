require_relative 'log.rb'

class Account
  attr_reader :balance, :log
  
  def initialize(log = Log.new)
    @log = log
    @balance = 0
  end

  def make_deposit(type, amount)
    @balance += amount
    @log.store_transaction(:credit, @balance)
  end

  def make_withdrawal(type, amount)
    @balance -= amount
    @log.store_transaction(:debit, @balance)
  end

  def display_statement
    @log.print_statement
  end

end
