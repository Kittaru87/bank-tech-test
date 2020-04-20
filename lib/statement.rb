require_relative 'account'

class Statement

  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print

   puts "date || credit || debit || balance\n"
   
    @history.reverse.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end

end