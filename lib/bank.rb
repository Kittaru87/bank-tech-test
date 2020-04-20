class Account

  attr_reader :balance, :statement
  
  def initialize
    @balance = 0
    @statement = []
  end
  
  def deposit(amount, date)
    @balance += amount
    @statement.push([ "#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}" ])
  end


end