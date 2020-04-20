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

  end

end

