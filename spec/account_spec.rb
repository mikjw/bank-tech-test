require 'account.rb'

describe Account do
  subject(:account) { described_class.new(test_log) }

  let (:test_log) { Log.new }
  let (:account_2) { Account.new }

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

  describe 'interaction with log' do
    before (:example) do 
      spy_log = spy('spy_log')
      account_3 = Account.new(spy_log)

      it 'calls log to display statement' do
        account_3.display_statement
        expect(spy_log).to have_received(:print_statement)
      end
    end
  end 
end
