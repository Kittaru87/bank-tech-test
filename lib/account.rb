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
    add_to_history(amount, "credit")
  end

  def withdraw(amount)
    funds?(amount)
    @balance -= amount
    add_to_history(amount, "debit")
  end

  private

  def funds?(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?
  end

  def decimal_format(amount)
    format('%.2f', amount)
  end

  def add_to_history(amount, transaction)
    if transaction == "credit"
      @history << @transaction.new(credit: decimal_format(amount), balance: decimal_format(@balance))
    else
      @history << @transaction.new(debit: decimal_format(amount), balance: decimal_format(@balance))
    end
  end

end
