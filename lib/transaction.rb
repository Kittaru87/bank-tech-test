require_relative 'account'

class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: Time, credit: 0, debit: 0, balance: 0)
    @date = date.now.strftime('%d/%m/%y')
    @credit = credit
    @debit = debit
    @balance = balance
  end 



end