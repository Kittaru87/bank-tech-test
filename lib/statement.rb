# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print
    puts "date || credit || debit || balance\n" + transactions_to_statement
  end

  private

  def transactions_to_statement
    statement_array = []
    @history.reverse.each do |transaction|
      credit = remove_nil(transaction.credit)
      debit = remove_nil(transaction.debit)
      statement_array << "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance}\n"
    end
    statement_array.join('')
  end

  def remove_nil(number)
    number == 0 ? nil : number
  end
end
