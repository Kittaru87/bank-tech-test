# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print_statement
    puts "date || credit || debit || balance\n" + add_statement
  end

  private

  def add_statement
    @balance = 0
    statement = @history.map do |transaction|
      credit = transaction.credit
      debit = transaction.debit
      calculate_balance(credit, debit)
      "#{transaction.date} || #{decimal_format(credit)} || #{decimal_format(debit)} || #{decimal_format(@balance)}\n"
    end
    statement.reverse.join('')
  end

  def decimal_format(number)
    number == 0 ? nil : '%.2f' % number
  end

  def calculate_balance(credit, debit)
    credit.to_i > 0 ? @balance += credit : @balance -= debit
  end
end
