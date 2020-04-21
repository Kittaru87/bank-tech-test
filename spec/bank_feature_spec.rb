require 'account'
require 'statement'

describe "A user can interact with their bank account" do

  before(:each) do
    @account = Account.new
    @date = Time.now.strftime("%d/%m/%Y")
  end

  it 'can deposit some money into the account' do
    @account.deposit(100.00)
    statement = Statement.new(@account.history)
    printed_statement = "date || credit || debit || balance\n#{@date} || 100.00 ||  || 100.00\n"
    expect{statement.print}.to output(printed_statement).to_stdout
  end

  # it 'can withdraw some money from the account' do
  #   @account.deposit(100.00)
  #   @account.withdraw(50.00)
  #   expect(@account.balance).to eq(50.00)
  # end

  # it 'can print a statment' do
  #   Timecop.freeze(2020, 04, 19, 0, 0, 0) do
  #     @account.deposit(100.00)
  #   end
  #   Timecop.freeze(2020, 04, 20, 0, 0 , 0) do
  #     @account.withdraw(50.00)
  #   end
  #   statement = Statement.new(@account.history)
  #   expect { statement.print }.to output("date || credit || debit || balance\n
  #   20/04/20 ||  || 50.00 || 50.00\n
  #   19/04/20 || 100.00 ||  || 100.00\n").to_stdout
  # end

end