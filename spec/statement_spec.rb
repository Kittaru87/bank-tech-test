require 'statement'

describe Statement do

  it 'prints a blank statement when no transactions have been made' do
    blank = Statement.new([])
    expect{blank.print}.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints a statement' do
    account = Account.new
    account.deposit(100.00)
    account.withdraw(50.00)
    statement = Statement.new(account.history)
    puts account.history.each{|thing| puts thing}
    expect{statement.print}.to output("date || credit || debit || balance\n20/04/20 || || 50.00 || 50.00\n20/04/20 || 100.00 || || 100.00\n").to_stdout
  end


end