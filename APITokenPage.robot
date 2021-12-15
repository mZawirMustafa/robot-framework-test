#API Token Page

*** Settings ***

Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}  dt_login_button
${email_field}    name=email
${token}

*** Keyword ***
Open Settings Page
  wait until page does not contain element    //*[@id="dt_core_header_acc-info-preloader"]     timeout=60
  wait until page contains element    //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a      timeout=60
  click element    //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a
  wait until page does not contain element      //*[@class="initial-loader account__initial-loader"]        timeout=60
  wait until page contains element    //*[@id="dc_api-token_link"]      timeout=60
  click element    //*[@id="dc_api-token_link"]

Check API scopes
  wait until page contains element    //*[text()="Read" and contains(@class, " dc-checkbox")]     timeout=60
  click element    //*[text()="Read" and contains(@class, " dc-checkbox")]
  checkbox should be selected    //*[@name="read"]
  click element    //*[text()="Trade" and contains(@class, " dc-checkbox")]
  checkbox should be selected    //*[@name="trade"]
  click element    //*[text()="Payments" and contains(@class, " dc-checkbox")]
  checkbox should be selected    //*[@name="payments"]
  click element    //*[text()="Admin" and contains(@class, " dc-checkbox")]
  checkbox should be selected    //*[@name="admin"]
  click element    //*[text()="Trading information" and contains(@class, " dc-checkbox")]
  checkbox should be selected    //*[@name="trading_information"]
  click element    //*[text()="Trade" and contains(@class, " dc-checkbox")]
  click element    //*[text()="Payments" and contains(@class, " dc-checkbox")]
  click element    //*[text()="Admin" and contains(@class, " dc-checkbox")]
  click element    //*[text()="Trading information" and contains(@class, " dc-checkbox")]

Check token creation - letters in valid range
   input text    //*[@name="token_name"]        Test
   page should contain      Length of token name must be between 2 and 32 characters.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE

Check token creation - numbers in valid range
   input text    //*[@name="token_name"]        1234
   page should contain      Length of token name must be between 2 and 32 characters.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE


Check token creation - special characters in valid range
   input text    //*[@name="token_name"]        _&*(
   page should contain      Only letters, numbers, and underscores are allowed.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE

Check token creation - combination of characters in valid range
   input text    //*[@name="token_name"]        a1_@
   page should contain      Only letters, numbers, and underscores are allowed.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE

Check token creation - letters lower than 2
   input text    //*[@name="token_name"]        a
   page should contain      Length of token name must be between 2 and 32 characters.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE

Check token creation - letters higher than 32
   input text    //*[@name="token_name"]        123456789012345678901234567890123
   page should contain      Maximum 32 characters.
   press keys    //*[@name="token_name"]        CTRL+A      DELETE

Check token creation - no characters entered
    page should contain    Please enter a token name.

Check the list of created tokens
   input text    //*[@name="token_name"]        anything
   page should contain      Length of token name must be between 2 and 32 characters.
   wait until page does not contain element    //*[@id="dt_core_header_acc-info-preloader"]     timeout=60
   click element    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
   page should contain    anything

Copy created token
   get text    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[2]/div/p


Delete created token
   wait until page contains element     //*[text()="Delete"]      timeout=60
   page should contain element    //*[text()="Delete"]
   click element    //*[text()="Delete"]//parent::button
   wait until page contains element     //*[text()="No"]//parent::button    timeout=60
   click element    //*[text()="No"]//parent::button
   page should contain element    //*[text()="Delete"]
   click element    //*[text()="Delete"]//parent::button
   wait until page contains element     //*[text()="Yes"]//parent::button    timeout=60
   click element    //*[text()="Yes"]//parent::button




*** Test Cases ***
AU_01
  Login     ${my_email}    ${my_pw}
AU_02
  Open Settings Page
  Check API scopes
AU_03
  Check token creation - letters in valid range
  Check token creation - numbers in valid range
  Check token creation - special characters in valid range
  Check token creation - combination of characters in valid range
  Check token creation - letters lower than 2
  Check token creation - letters higher than 32
  Check token creation - no characters entered
AU_04
  Check the list of created tokens
  #Copy created token
  Delete created token



# Close Browser