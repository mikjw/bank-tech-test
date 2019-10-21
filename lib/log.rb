class Log
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def store_transaction(balance)
    @transactions << {:balance => balance}
  end 
end 
