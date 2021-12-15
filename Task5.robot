#Task 5

*** Settings ***

Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}  dt_login_button
${email_field}    name=email


*** Keyword ***
Underlying
  wait until page contains element    //*[text()="Synthetic Indices"]     timeout=60
  click element    //*[text()="Synthetic Indices"]
  wait until page contains element    //*[text()="Volatility 50 Index"]     timeout=60
  click element    //*[text()="Volatility 50 Index"]

Contract Type
  wait until page contains element    //*[@id="dt_contract_dropdown"]       timeout=60
  click element    //*[@id="dt_contract_dropdown"]
  wait until page contains element   //*[@id="dt_contract_multiplier_item"]     timeout=60
  click element    //*[@id="dt_contract_multiplier_item"]
  page should not contain    //*[text()="Payout"]
  page should contain element   //*[text()="Take profit"]
  page should contain element    //*[text()="Stop loss"]
  page should contain element    //*[text()="Deal cancellation"]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[2]
  checkbox should be selected    //*[@id="dc_take_profit-checkbox_input"]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[2]
  checkbox should not be selected    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[1]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[2]
  checkbox should be selected    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[1]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[2]
  checkbox should not be selected    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[1]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[2]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[2]
  checkbox should be selected    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[1]
  checkbox should be selected    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[1]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[5]/div/label/span[2]
  checkbox should be selected    //*[@id="trade_container"]/div[4]/div/fieldset[5]/div/label/span[1]
  checkbox should not be selected    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div/label/span[1]
  checkbox should not be selected    //*[@id="trade_container"]/div[4]/div/fieldset[4]/div/label/span[1]
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[5]/div/label/span[2]

Check Multiplier Option
  wait until page contains element    //*[@id="dropdown-display"]/span      timeout=60
  click element    //*[@id="dropdown-display"]/span
  page should contain element      //*[@id="20"]       timeout=60
  page should contain element     //*[@id="40"]
  page should contain element     //*[@id="60"]
  page should contain element     //*[@id="100"]
  page should contain element     //*[@id="200"]
  click element    //*[@id="20"]

Check Maximum and Minimum
  press keys    //*[@id="dt_amount_input"]      CTRL+A      DELETE
  input text    //*[@id="dt_amount_input"]      2001
  wait until page contains    Maximum stake allowed is 2000.00.
  press keys    //*[@id="dt_amount_input"]      CTRL+A      DELETE
  input text    //*[@id="dt_amount_input"]      0
  wait until page contains    Please enter a stake amount that's at least 1.00.
  press keys    //*[@id="dt_amount_input"]      CTRL+A      DELETE
  input text    //*[@id="dt_amount_input"]      1

Check Deal Cancellation
  click element    //*[@id="trade_container"]/div[4]/div/fieldset[5]/div/label/span[2]
  click element   //*[@id="trade_container"]/div[4]/div/fieldset[5]/div[2]/div
  page should contain element      //*[@id="5m"]
  page should contain element     //*[@id="10m"]
  page should contain element     //*[@id="15m"]
  page should contain element     //*[@id="30m"]
  page should contain element     //*[@id="60m"]
  click element    //*[@id="5m"]


*** Test Cases ***
Open Deriv
  Login     ${my_email}    ${my_pw}
Check multiplier contract parameter
  wait until page does not contain element    //*[@class="chart-container__loader"]        timeout=60
  wait until page contains element    //*[@class="cq-chart-price"]     timeout=60
  click element    //*[@class="cq-chart-price"]
  Underlying
  Contract Type
  Check Multiplier Option
  Check Maximum and Minimum
  Check Deal Cancellation




# Close Browser