# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'prints a blank statement when no transactions have been made' do
    blank = Statement.new([])
    expect { blank.print }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints a statement' do
    account = Account.new
    account.deposit(100.00)
    account.withdraw(50.00)
    statement = Statement.new(account.history)
    expect { statement.print }.to output("date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%y')} ||  || 50.00 || 50.00\n#{Time.now.strftime('%d/%m/%y')} || 100.00 ||  || 100.00\n").to_stdout
  end
end
