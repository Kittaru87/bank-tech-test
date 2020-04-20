# frozen_string_literal: true

class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount, date)
    @balance += amount
    @statement.push(["#{date} || #{'%.2f' % amount} || || #{format('%.2f', @balance)}"])
  end

  def withdraw(amount, date)
    @balance -= amount
    @statement.push(["#{date} || || #{'%.2f' % amount} || #{format('%.2f', @balance)}"])
  end
end
