# frozen_string_literal: true

class Account
  attr_reader :balance, :statement

  def initialize(name)
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement.push(["#{date_format(date)} || #{'%.2f' % amount} || || #{format('%.2f', @balance)}"])
  end

  def withdraw(amount)
    @balance -= amount
    @statement.push(["#{date_format(date)} || || #{'%.2f' % amount} || #{format('%.2f', @balance)}"])
  end

  def print
    most_recent_first.split(", ").each{|transaction| puts transaction}
  end

  private 

  def most_recent_first
    "date || credit || debit || balance, " + @statement.reverse.join(", ")
  end

  def date_format(date)
    date.gsub("-", "/")
  end
end
