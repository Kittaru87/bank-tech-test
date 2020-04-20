require 'transaction'

describe Transaction do

  let(:transaction) { described_class.new }

  it 'initializes with the current date' do
    expect(transaction.date).to eq("#{Time.now.strftime('%d/%m/%y')}") 
  end

end
