
class Transaction

  attr_reader :date, :credit

  def initialize
    @date = Time.now.strftime('%d/%m/%y')
    @credit = 0
  end 



end