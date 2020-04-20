# frozen_string_literal: true

require 'bank'

describe Account do
  before(:each) do
    @account = Account.new
    @account.deposit(1000.00, '10/01/2020')
  end

  it 'can accept a deposit of £1000 on 10 January 2020' do
    expect(@account).to have_attributes(balance: 1000.00)
    expect(@account).to have_attributes(statement: [['10/01/2020 || 1000.00 || || 1000.00']])
  end

  it 'can accept a second deposit £2,000 on 13 January 2020' do
    @account.deposit(2000.00, '13/01/2020')
    expect(@account).to have_attributes(balance: 3000.00)
    expect(@account).to have_attributes(statement: [['10/01/2020 || 1000.00 || || 1000.00'], ['13/01/2020 || 2000.00 || || 3000.00']])
  end


  it 'can accept a withdrawal of £500 on 14 January 2020' do
    @account.withdraw(500.00, '14/01/2020')
    expect(@account).to have_attributes(balance: 500.00)
    expect(@account).to have_attributes(statement: [['10/01/2020 || 1000.00 || || 1000.00'], ['14/01/2020 || || 500.00 || 500.00']])
  end

  it 'can print a statement of your banking activity' do
    @account.deposit(2000.00, '13/01/2020')
    @account.withdraw(500.00, '14/01/2020')
    expect(@account.print).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
