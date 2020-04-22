# frozen_string_literal: true

require 'account'
require 'statement'

describe 'A user can interact with their bank account' do
  let(:account) { Account.new }
  let(:statement) { Statement.new(account.history) }

  before(:each) do
    @date = Time.now.strftime('%d/%m/%Y')
    account.deposit(100.00)
  end

  it 'can deposit some money into the account' do
    printed_statement = "date || credit || debit || balance\n#{@date} || 100.00 ||  || 100.00\n"
    expect { statement.print_statement }.to output(printed_statement).to_stdout
  end

  it 'can withdraw some money from the account' do
    account.withdraw(50.00)
    printed_statement = "date || credit || debit || balance\n#{@date} ||  || 50.00 || 50.00\n#{@date} || 100.00 ||  || 100.00\n"

    expect { statement.print_statement }.to output(printed_statement).to_stdout
  end

  it 'can print a statment in reverse chronological order' do
    account.deposit(100.00)
    printed_statement = "date || credit || debit || balance\n#{@date} || 100.00 ||  || 200.00\n#{@date} || 100.00 ||  || 100.00\n"

    expect { statement.print_statement }.to output(printed_statement).to_stdout
  end
end
