module KnowsMyAccount
  def my_account
    @my_account || Account.new
  end
end

class Account
  def deposit(amount)
    @balance = amount
  end

  def balance
    @balance
  end
end

class Teller
  def withdraw_from(account, amount)
  end
end


# encoding utf-8
CAPTURE_CASH_AMOUNT = Transform /^(£|\$|€)(\d+)$/ do |currency_symbol, digits|
  # we now need a currency class comment
  Currency::Money.new(digits, currency_symbol)
end

Given /^I have deposited \$(#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.deposit(amount)
  my_account.balance.should eq(amount),"Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When /^I withdraw (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller = Teller.new
  teller.withdraw_from(my_account, amount) # express the regexp above with the code you wish you had
end

Then /^\$(\d+) should be dispensed.$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
