# frozen_string_literal: true

require 'account'
require 'statement'

describe 'A user can interact with their bank account' do
  before(:each) do
    @account = Account.new
    @date = Time.now.strftime('%d/%m/%Y')
    @account.deposit(100.00)
    @account.withdraw(50.00)
    @statement = Statement.new(@account.history)
  end

  it 'can deposit some money into the account' do
    @account.deposit(50.00)
    expect(@account.balance).to eq(100.00)
  end

  it 'can withdraw some money from the account' do
    @account.withdraw(50.00)
    expect(@account.balance).to eq(0)
  end

  it 'can print a statment' do
    printed_statement = "date || credit || debit || balance\n#{@date} ||  || 50.00 || 50.00\n#{@date} || 100.00 ||  || 100.00\n"

    expect { @statement.print }.to output(printed_statement).to_stdout
  end
end
