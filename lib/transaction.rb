
class Transaction

  attr_reader :date, :credit, :debit

  def initialize
    @date = Time.now.strftime('%d/%m/%y')
    @credit = 0
    @debit = 0
  end 



end