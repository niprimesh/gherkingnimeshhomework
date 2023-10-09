Feature: NopCommerce RegisterFunctionality

  As a user, i would like to register on nopCommerce with valid credentials

  Scenario: User should login with valid credentials successfully

    Given     User is in register page
    When      User enter "ram" in first name field
    And       User enter "shyam" in last name field
    And       User enter"abc@gmail.com" in abc@gmail.com field
    And       User enter " abc@gmail.com" in username field
    And       User enter "123456" in passowrld field
    And       User enter"123456" in confirm password field
    And       User click on register button
    Then      User get message register successfully

  Scenario Outline:  User should not login with wrong or blank credentials

    Given     User is in register page
    When      User enter "<first name>"in first name field
    And       User enter "<last name>" in last name field
    And       User enter"<email id>" in email id field
    And       User enter "<Password>" in passowrld field
    And       User enter"<Password>" in confirm password field
    And       User click on login button
    Then      User is not logged in
    And       User can see error message
    Examples:

      | First name | lastname | email id      | Password | confirmed password | eroor message                             |
      |            | shyam    | abc@gmail.com | 123456   | 123456             | blank first name field error              |
      | ram        |          | abc@gmail.com | 123456   | 123456             | blank last name field error               |
      | ram        | shyam    |               | 123456   | 123456             | Blank email id error                      |
      | ram        | shyam    | abc@gmail.com |          | 123456             | blank password error                      |
      | Ram        | shyam    | abc@gmail.com | 123456   |                    | blank confirm password error              |
      | Ram        | shyam    | abc@gmail.com | 123456   | 23456              | password and confirm password not matched |