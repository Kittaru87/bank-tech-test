# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :current_balance, :history, :transaction

  def initialize(transaction = Transaction)
    @current_balance = 0
    @history = []
    @transaction = transaction
  end

  def deposit(amount)
    @current_balance += amount
    add_to_history(amount, 'credit')
  end

  def withdraw(amount)
    funds?(amount)
    @current_balance -= amount
    add_to_history(amount, 'debit')
  end

  private

  def funds?(amount)
    raise 'Insufficient funds' if (@current_balance - amount).negative?
  end

  def add_to_history(amount, transaction)
    if transaction == 'credit'
      @history << @transaction.new(credit: amount)
    else
      @history << @transaction.new(debit: amount)
    end
  end
end
