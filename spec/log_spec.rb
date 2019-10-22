require 'log.rb'

describe Log do
  subject(:log) { described_class.new }
  let (:test_date) { double :test_date }
  
  before do 
    allow(Date).to receive(:new).and_return test_date
  end 

  describe '#initialization' do
    it "initializes with empty array of transactions" do
      expect(log.transactions).to eq([])
    end
  end

  describe 'storing balances' do
    it "stores 275 when given 275" do
      log.store_transaction(:credit, 275, 275)
      expect(log.transactions).to eq([{:date => test_date, :type => :credit, :amount => 275, :balance => "275.00"}])
    end

    it "stores 300 when given 300" do
      log.store_transaction(:credit, 300, 300)
      expect(log.transactions).to eq([{:date => test_date, :type => :credit, :amount => 300, :balance => "300.00"}])
    end
  end

  describe 'storing dates' do
    it 'adds the date to a transaction' do
      log.store_transaction(:credit, 300, 300)
      expect(log.transactions).to eq([{:date => test_date, :type => :credit, :amount => 300, :balance => "300.00"}])
    end
  end 

  describe 'storing transaction types' do
    it 'adds type credit to a deposit' do
      log.store_transaction(:credit, 300, 300)
      expect(log.transactions).to eq([{:date => test_date, :type => :credit, :amount => 300, :balance => "300.00"}])
    end

    it 'adds type debit to a withdrawal' do
      log.store_transaction(:debit, 300, 300)
      expect(log.transactions).to eq([{:date => test_date, :type => :debit, :amount => 300, :balance => "300.00"}])
    end
  end 

  describe 'printing statements' do 
    it "prints an empty statement with headers" do
      output_string = "date || credit || debit || balance\n"
      expect{ log.print_statement }.to output(output_string).to_stdout
    end

    it "prints balance statement after one deposit" do
      log.store_transaction(:credit, 275, 275)
      output_string = "date || credit || debit || balance\n#{test_date} || 275 || || 275.00\n"
      expect{ log.print_statement }.to output(output_string).to_stdout
    end

    it "prints balance statement after two deposits" do
      log.store_transaction(:credit, 275, 275)
      log.store_transaction(:credit, 25, 300)
      output_string = "date || credit || debit || balance\n#{test_date} || 25 || || 300.00\n#{test_date} || 275 || || 275.00\n"
      expect{ log.print_statement }.to output(output_string).to_stdout
    end

    it "prints balance statement after a deposit and a withdrawal" do
      log.store_transaction(:credit, 275, 275)
      log.store_transaction(:debit, 25, 250)
      output_string = "date || credit || debit || balance\n#{test_date} || || 25 || 250.00\n#{test_date} || 275 || || 275.00\n"
      expect{ log.print_statement }.to output(output_string).to_stdout
    end
  end
end
