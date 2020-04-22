# frozen_string_literal: true

require_relative 'account'

class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date: Time, credit: 0, debit: 0)
    @date = date.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
  end
end
