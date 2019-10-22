require 'account.rb'

describe Account do
  subject(:account) { described_class.new(test_log) }

  let (:test_log) { Log.new }
  let (:account_2) { Account.new }
  let (:spy_log) { spy('spy_log') }
  let (:account_3) { Account.new(spy_log) }

  before do
    account_3.deposit(250)
    expect(spy_log).to have_received(:store_transaction).with(:credit, 250, 250)
  end

  describe 'initialization' do
    it "initializes with a balance of 0" do
      expect(account.balance).to eq(0)
    end

    it 'initializes with a log' do
      expect(account.log).to eq(test_log)
    end 

    it 'creates a new log if none given' do
      expect(account_2.log).not_to be(nil)
    end
  end

  describe 'updating balance' do
    it "increases balance by 275 for deposit of 275" do
      account.deposit(275)
      expect(account.balance).to eq(275)
    end

    it "increases balance by 300 for deposit of 275 and 25" do
      account.deposit(275)
      account.deposit(25)
      expect(account.balance).to eq(300)
    end

    it "decreases balance by 200 for withdrawal of 200" do
      account.deposit(275)
      account.withdrawal(200)
      expect(account.balance).to eq(75)
    end
  end

  describe 'interaction with log' do
    it 'calls log to display statement' do
      account_3.display_statement
      expect(spy_log).to have_received(:print_statement)
    end

    it 'passes deposits to log' do
      account_3.deposit(250)
      expect(spy_log).to have_received(:store_transaction).with(:credit, 250, 500)
    end

    it 'passes withdrawals to log' do
      account_3.withdrawal(50)
      expect(spy_log).to have_received(:store_transaction).with(:debit, 50, 200)
    end

    it 'passes type credit for a deposit' do
      account_3.deposit(250)
      expect(spy_log).to have_received(:store_transaction).with(:credit, 250, 500)
    end

    it 'passes type debit for a withdrawal' do
      account_3.withdrawal(100)
      expect(spy_log).to have_received(:store_transaction).with(:debit, 100, 150)
    end

    it 'passes deposit amount to log' do
      account_3.deposit(100)
      expect(spy_log).to have_received(:store_transaction).with(:credit, 100, 350)
    end

    it 'passes withdrawal amount to log' do
      account_3.withdrawal(100)
      expect(spy_log).to have_received(:store_transaction).with(:debit, 100, 150)
    end
  end

  describe 'input' do
    it 'raises error if withdrawal exceeds balance' do
      account.deposit(100)
      expect{ account.withdrawal(200) }.to raise_error("Insufficient funds")
    end
  end
end
