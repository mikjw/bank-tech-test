require 'log.rb'

describe Log do
  subject(:log) { described_class.new }

  it "initializes with empty array of transactions" do
    expect(log.transactions).to eq([])
  end

  it "stores 275 when given 275" do
    log.store_transaction(275)
    expect(log.transactions).to eq([{:balance => "275.00"}])
  end

  it "stores 300 when given 300" do
    log.store_transaction(300)
    expect(log.transactions).to eq([{:balance => "300.00"}])
  end

  it "prints an empty statement with balance" do
    output_string = "balance\n"
    expect{ log.print_statement }.to output(output_string).to_stdout
  end

  it "prints balance statement after one deposit" do
    log.store_transaction(275)
    output_string = "balance\n275.00\n"
    expect{ log.print_statement }.to output(output_string).to_stdout
  end

  it "prints balance statement after two deposit" do
    log.store_transaction(275)
    log.store_transaction(300)
    output_string = "balance\n300.00\n275.00\n"
    expect{ log.print_statement }.to output(output_string).to_stdout
  end
end
