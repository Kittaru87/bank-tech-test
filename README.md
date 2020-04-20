# Bank Tech Test

Makers Week 10 Individual Challenges

**Tech used**

Language: ruby

Testing: rspec

Linting: rubocop, simplecov

## Specification
Write a program that can be used by irb to simulate a user's interaction with their bank account.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement she would see:

date || credit || debit || balance

14/01/2012 || || 500.00 || 2500.00

13/01/2012 || 2000.00 || || 3000.00

10/01/2012 || 1000.00 || || 1000.00

### user stories
```
As a customer
So that I can save money
I want to be able to deposit money into my account

As a customer
So that I can spend my money
I want to be able to withdraw money from my account

As a customer
So I may have a better understanding of my financial outgoings
I want to be able to see a printed statement of my withdrawals and deposits (newest first)
```

### irb test
```
$ require './account.rb'
=> true 

$ account = Account.new
=> #<Account:0x00007fdc021ecf90 @balance=0, @history=[], @transaction=Transaction> 

$ account.deposit(100.00)
=> [#<Transaction:0x00007fdc021fcdf0 @date="20/04/20", @credit="100.00", @debit=0, @balance="100.00">] 

$ account.withdraw(50.00)
=> [#<Transaction:0x00007fa460949588 @date="20/04/20", @credit="100.00", @debit=0, @balance="100.00">, #<Transaction:0x00007fa460959000 @date="20/04/20", @credit=0, @debit="50.00", @balance="50.00">] 

```

### edge cases
* Should the user be able to withdraw money when they have 0 balance?