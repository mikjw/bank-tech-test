require 'account.rb'

describe Account do
  subject(:account) { described_class.new(test_log) }

  let (:test_log) { Log.new }

  describe 'updating balance' do
    it "initializes with a balance of 0" do
      expect(account.balance).to eq(0)
    end

    it "increases balance by 275 for deposit of 275" do
      account.make_deposit(275)
      expect(account.balance).to eq(275)
    end

    it "increases balance by 300 for deposit of 275 and 25" do
      account.make_deposit(275)
      account.make_deposit(25)
      expect(account.balance).to eq(300)
    end

    it "decreases balance by 200 for withdrawal of 200" do
      account.make_deposit(275)
      account.make_withdrawal(200)
      expect(account.balance).to eq(75)
    end
  end

  describe 'displaying statement' do
    it 'initializes with a log' do
      expect(account.log).to eq(test_log)
    end 

    it 'creates a new log if none given' do
      account_2 = Account.new
      expect(account_2.log).not_to be(nil)
    end

    it 'displays statement using log' do
      spy_log = spy('spy_log')
      account_3 = Account.new(spy_log)
      account_3.display_statement
      expect(spy_log).to have_received(:print_statement)
    end
  end
end
