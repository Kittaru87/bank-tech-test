# frozen_string_literal: true
require_relative "transaction"

class Account
  attr_reader :balance, :history, :transaction

  def initialize(transaction = Transaction)
    @balance = 0
    @history = []
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @history << @transaction.new(credit: '%.2f' % amount, balance: '%.2f' % @balance)
  end

 
end
