# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :history, :transaction

  def initialize(transaction = Transaction)
    @history = []
    @transaction = transaction
  end

  def deposit(amount)
    add_to_history(amount, 'credit')
  end

  def withdraw(amount)
    add_to_history(amount, 'debit')
  end

  private

  def add_to_history(amount, transaction)
    @history << if transaction == 'credit'
                  @transaction.new(credit: amount)
                else
                  @transaction.new(debit: amount)
                end
  end
end
