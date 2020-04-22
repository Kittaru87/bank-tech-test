# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :history, :balance

  def initialize(history)
    @history = history
    @balance = 0
  end

  def print_statement
    puts "date || credit || debit || balance\n" + add_statement
    reset_balance
  end

  private

  def add_statement
    statement = @history.map do |transaction|
      credit = transaction.credit
      debit = transaction.debit
      calculate_balance(credit, debit)
      "#{transaction.date} || #{decimal_format(credit)} || #{decimal_format(debit)} || #{decimal_format(@balance)}\n"
    end
    statement.reverse.join("")
  end

  def decimal_format(number)
    number == 0 ? nil : '%.2f' % number
  end

  def calculate_balance(credit, debit)
    @balance += credit if credit.to_i > 0
    @balance -= debit if debit.to_i > 0
  end

  def reset_balance
    @balance = 0
  end

end
