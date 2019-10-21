require 'log.rb'

describe Log do
  subject(:log) { described_class.new }

  it "initializes with empty array of transactions" do
    expect(log.transactions).to eq([])
  end
end