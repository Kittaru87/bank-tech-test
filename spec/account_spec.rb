# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'initializes with an empty balance' do
    expect(account).to have_attributes(balance: 0)
  end

  it 'initializes with an empty history' do
    expect(account).to have_attributes(history: [])
  end

  describe '#deposit' do
    it 'can deposit some money into the account' do
      account.deposit(100.50)
      expect(account.balance).to eq(100.50)
    end

    it 'will populate the history with the deposit' do
      transaction = double('transaction')
      allow(transaction).to receive(:new).with(credit: '100.50', balance: '100.50') { transaction }
      account = Account.new(transaction)
      account.deposit(100.50)
      expect(account.history).to include(transaction)
    end
  end

  describe '#withdraw' do
    it 'can withdraw some money from the account' do
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'will populate the history with the withdrawal' do
      transaction = double('transaction')
      allow(transaction).to receive(:new).with(credit: '100.00', balance: '100.00') { transaction }
      allow(transaction).to receive(:new).with(debit: '50.00', balance: '50.00') { transaction }
      account = Account.new(transaction)
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.history).to include(transaction, transaction)
    end
  end
end
