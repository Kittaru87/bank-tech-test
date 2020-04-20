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

  def print
    add_headings.split(", ").each{|transaction| puts transaction}
  end

  private 

  def add_headings
    "date || credit || debit || balance, " + @statement.reverse.join(", ")
  end
end
