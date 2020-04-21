# frozen_string_literal: true
require 'timecop'
require 'statement'

describe Statement do
  it 'prints a blank statement when no transactions have been made' do
    blank = Statement.new([])
    expect { blank.print }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints a statement' do
    account = Account.new
    Timecop.freeze(2020, 04, 19, 0, 0, 0) do
      account.deposit(100.00)
    end
    Timecop.freeze(2020, 04, 20, 0, 0 , 0) do
      account.withdraw(50.00)
    end
    statement = Statement.new(account.history)
    expect { statement.print }.to output("date || credit || debit || balance\n20/04/2020 ||  || 50.00 || 50.00\n19/04/2020 || 100.00 ||  || 100.00\n").to_stdout
  end
end
