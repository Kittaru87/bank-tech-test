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
      account.deposit(100.00)
      expect(account.balance).to eq(100.00)
    end

    it 'can deposit money with change into the account' do
      account.deposit(96.48)
      expect(account.balance).to eq(96.48)
    end
  end

  describe '#withdraw' do
    it 'can withdraw some money from the account' do
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'can withdraw some money with change from the account' do
      account.deposit(100.00)
      account.withdraw(37.48)
      expect(account.balance).to eq(62.52)
    end
  end

  it 'will populate the history with a deposit and/or withdrawal' do
    transaction = double('transaction')
    allow(transaction).to receive(:new).with(credit: '100.00', balance: '100.00') { transaction }
    allow(transaction).to receive(:new).with(debit: '50.00', balance: '50.00') { transaction }
    account = Account.new(transaction)
    account.deposit(100.00)
    account.withdraw(50.00)
    expect(account.history).to include(transaction, transaction)
  end

  it 'will not allow you to withdraw cash if the withdrawal amount takes you past 0' do
    account.deposit(100.00)
    expect{account.withdraw(101.00)}.to raise_error "Insufficient funds"
  end

  
end
