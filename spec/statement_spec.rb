require 'statement'

describe Statement do

  it 'prints a blank statement when no transactions have been made' do
    blank = Statement.new([])
    expect{blank.print}.to output("date || credit || debit || balance\n").to_stdout
  end


end