require 'date'

class Log
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def store_transaction(type, amount, balance)
    @date = format_date(Date.today)
    @transactions << {:date => @date, :type => type, :amount => amount, :balance => balance}
  end

  def print_statement
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      if transaction[:type] == :credit
        puts "#{transaction[:date]} || #{transaction[:amount]} || || #{format_number(transaction[:balance])}"
      elsif transaction[:type] == :debit
        puts "#{transaction[:date]} || || #{transaction[:amount]} || #{format_number(transaction[:balance])}"
      end
    end
  end

  private

  def format_number(number)
    format('%.2f', number)
  end

  def format_date(date)
    "#{date.day}/#{date.month}/#{date.year}"
  end
end
