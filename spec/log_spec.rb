require 'log.rb'

describe Log do
  subject(:log) { described_class.new }

  it "initializes with empty array of transactions" do
    expect(log.transactions).to eq([])
  end

  it "stores 275 when given 275" do
    log.store_transaction(275)
    expect(log.transactions).to eq([{:balance => 275}])
  end

  it "stores 300 when given 300" do
    log.store_transaction(300)
    expect(log.transactions).to eq([{:balance => 300}])
  end
end
