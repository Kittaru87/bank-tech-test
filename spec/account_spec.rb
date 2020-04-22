# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'initializes with an empty history' do
    expect(account).to have_attributes(history: [])
  end

  describe '#deposit' do
    it 'can populate the history with a deposit transaction' do
      account.deposit(100.00)
      expect(account.history.length).to eq(1)
    end
  end

  describe '#withdraw' do
    it 'can populate the history with a withdrawal transaction' do
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.history.length).to eq(2)
    end
  end

  it 'will populate the history with a deposit and/or withdrawal' do
    transaction = double('transaction')
    allow(transaction).to receive(:new).with(credit: 100.0) { transaction }
    allow(transaction).to receive(:new).with(debit: 50.0) { transaction }
    account = Account.new(transaction)
    account.deposit(100.00)
    account.withdraw(50.00)
    expect(account.history).to include(transaction, transaction)
  end
end
