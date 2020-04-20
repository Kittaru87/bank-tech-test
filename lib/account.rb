# frozen_string_literal: true
require_relative "transaction"

class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
  end

 
end
