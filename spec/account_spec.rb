require 'account.rb'

describe Account do
  subject(:account) { described_class.new }

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

  it "prints an empty statement" do
    expect(account.print_statement).to eq("date || credit || debit || balance")
  end
end
