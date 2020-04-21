# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print
    puts "date || credit || debit || balance\n"

    @history.reverse.each do |transaction|
      credit = remove_nil(transaction.credit)
      debit = remove_nil(transaction.debit)
      puts "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance}"
    end
  end

  private

  def remove_nil(number)
    number == 0 ? nil : number
  end
end
