Feature: Cash Withdrawal

As a customer, in order to get cash for a haircut I will Withdraw
cash.

  Scenario: Successful Withdrawal from an account in credit
    Given I have deposited $100 in my account
    When I withdraw $20
    Then $20 should be dispensed.
