# Bank tech test

[![Build Status](https://travis-ci.com/mikjw/bank-tech-test.svg?branch=master)](https://travis-ci.com/mikjw/bank-tech-test)
### Installation

* Clone this repo and navigate to route 
* Run `bundle install` to install dependencies
* Run `rspec` and check the tests are passing
* Run `irb` (or equivalent) in the command line

### To run
```
2.6.3 :001 > require './lib/account.rb'
 => true 
2.6.3 :002 > a = Account.new
 => #<Account:0x00007ff44c83efa8 @log=#<Log:0x00007ff44c83ef80 @transactions=[]>, @balance=0> 
2.6.3 :003 > a.deposit(250)
 => [{:date=>"22/10/2019", :type=>:credit, :amount=>250, :balance=>250}] 
2.6.3 :004 > a.deposit(1000)
 => [{:date=>"22/10/2019", :type=>:credit, :amount=>250, :balance=>250}, {:date=>"22/10/2019", :type=>:credit, :amount=>1000, :balance=>1250}] 
2.6.3 :005 > a.withdraw(350)
 => [{:date=>"22/10/2019", :type=>:credit, :amount=>250, :balance=>250}, {:date=>"22/10/2019", :type=>:credit, :amount=>1000, :balance=>1250}, {:date=>"22/10/2019", :type=>:debit, :amount=>350, :balance=>900}] 
2.6.3 :006 > a.display_statement
date || credit || debit || balance
22/10/2019 || || 350 || 900.00
22/10/2019 || 1000 || || 1250.00
22/10/2019 || 250 || || 250.00
 => [{:date=>"22/10/2019", :type=>:debit, :amount=>350, :balance=>900}, {:date=>"22/10/2019", :type=>:credit, :amount=>1000, :balance=>1250}, {:date=>"22/10/2019", :type=>:credit, :amount=>250, :balance=>250}] 
2.6.3 :007 > 
```


### My approach

* Reviewing the spec, I first considered a single `Account` class with `deposit`, `withdraw` and `print_statement` methods.
* I also considered that a printing or transaction-logging class may be extrated as the program developed. 
* I began test driving the `Account` class to add the basic functions and store a balance in memory
* When the printer method started to take more than one parameter (initally only `balance`), I extracted a `Log` class which could store transaction details in an array of hashes.
* I added a validation enforcing integer-only user inputs because floats would risk inaccuracy as the program aged, with statement values formatted to 2dp (to meet spec) by the Log class. 
* Decimal inputs could be allowed in future by converting them to integers at the 'penny' level. 
* I added a guard clause to `withdraw` to defend against negative balances. An overdraft feature could be added if required. 
* Refactored with Rubocop.

* The TDD process let to a series of tests showing the development process. The process also led to duplication once complete; the full series of tests can be seen by browsing the files at [this](https://github.com/mikjw/bank-tech-test/commit/caa7090bacdaa75c1f32069f6934a10e6e13df90) commit from before refactoring.

#### Reflections
* Currently, every user command returns their transactions hash to the terminal - a privacy concern that could be avoided by returning a confirmation message instead. 

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
