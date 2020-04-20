# frozen_string_literal: true

require 'account'

describe Account do
  
  let(:account) { described_class.new }

  it 'initializes with an empty balance' do
    expect(account.balance).to eq(0)
  end

  it 'initializes with an empty history' do
    expect(account.history).to eq([])
  end

  describe '#deposit' do


  end

end

