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
end

