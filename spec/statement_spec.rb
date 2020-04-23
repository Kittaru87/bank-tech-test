# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:deposit) { double :transaction, credit: 100.00, debit: 0, date: '19/04/2020' }
  let(:withdrawal) { double :transaction, credit: 0, debit: 50.00, date: '20/04/2020' }

  it 'prints a blank statement when no transactions have been made' do
    blank = Statement.new([])
    expect { blank.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints a statement' do
    history = double('history')
    history = [deposit, withdrawal]
    statement = Statement.new(history)
    expect { statement.print_statement }.to output("date || credit || debit || balance\n20/04/2020 ||  || 50.00 || 50.00\n19/04/2020 || 100.00 ||  || 100.00\n").to_stdout
  end
end
