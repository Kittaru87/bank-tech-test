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
    @history << @transaction.new(credit: format('%.2f', amount), balance: format('%.2f', @balance))
  end

  def withdraw(amount)
    @balance -= amount
    has_funds?(amount)
    @history << @transaction.new(debit: format('%.2f', amount), balance: format('%.2f', @balance))
  end

  def has_funds?(amount)
    raise "Insufficient funds" if (@balance - amount) < 0
  end

end
