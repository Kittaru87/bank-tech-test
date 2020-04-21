# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :balance, :history, :transaction

  def initialize(transaction = Transaction)
    @balance = 0
    @history = []
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @history << @transaction.new(credit: decimal_format(amount), balance: decimal_format(@balance))
  end

  def withdraw(amount)
    @balance -= amount
    funds?(amount)
    @history << @transaction.new(debit: decimal_format(amount), balance: decimal_format(@balance))
  end

  private

  def funds?(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?
  end

  def decimal_format(amount)
    format('%.2f', amount)
  end

  

end
