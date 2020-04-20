require_relative 'account'

class Statement

  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print
   puts "date || credit || debit || balance\n"
  end

end