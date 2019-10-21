require 'log.rb'

describe Log do
  subject(:log) { described_class.new }

  it "initializes with empty array of transactions" do
    expect(log.transactions).to eq([])
  end

  it "stores transactions" do
    log.store_transaction(275)
    expect(log.transactions).to eq([{:balance => 275}])
  end

end
