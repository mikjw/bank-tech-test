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
end

