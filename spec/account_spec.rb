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

    before(:each) do
      account.deposit(100.00)
    end

    it 'can deposit some money into the account' do
      expect(account.balance).to eq(100.00)
    end

    it 'will populate the history with the deposit' do
      expect(account.history).to include{"@credit='100.00'"}
    end

  end


end

