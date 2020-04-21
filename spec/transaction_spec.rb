# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new }

  it 'initializes with the current date' do
    expect(transaction.date).to eq(Time.now.strftime('%d/%m/%Y'))
  end

  it 'initializes with no credit' do
    expect(transaction.credit).to eq(0)
  end

  it 'initializes with no debit' do
    expect(transaction.debit).to eq(0)
  end

  it 'initializes with 0 on balance' do
    expect(transaction.balance).to eq(0)
  end
end
