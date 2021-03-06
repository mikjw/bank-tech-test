require_relative 'log.rb'

class Account
  attr_reader :balance, :log
  
  def initialize(log = Log.new)
    @log = log
    @balance = 0
  end

  def deposit(amount)
    fail "Error: please enter a whole number" unless amount.is_a? Integer
    @balance += amount
    @log.store_transaction(:credit, amount, @balance)
  end

  def withdraw(amount)
    fail "Error: please enter a whole number" unless amount.is_a? Integer
    fail "Insufficient funds" unless amount <= @balance
    @balance -= amount
    @log.store_transaction(:debit, amount, @balance)
  end

  def display_statement
    @log.print_statement
  end
end
