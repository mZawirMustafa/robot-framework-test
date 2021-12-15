#Task 3

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
  wait until page contains element    //*[text()="AUD/USD"]     timeout=60
  click element    //*[text()="AUD/USD"]

Contract Type
  wait until page contains element    //*[@id="dt_contract_dropdown"]       timeout=60
  click element    //*[@id="dt_contract_dropdown"]
  wait until page contains element    //*[@id="dt_contract_high_low_item"]     timeout=60
  click element    //*[@id="dt_contract_high_low_item"]
  wait until page contains element    //*[@id="dt_simple_duration_datepicker"]        timeout=60
  clear element text    //*[@id="dt_simple_duration_datepicker"]/div/div/input
  input text    //*[@id="dt_simple_duration_datepicker"]/div/div/input        2
  press keys       dt_amount_input         CTRL+A      DELETE
  input text    dt_amount_input     15.50

*** Test Cases ***
Open Deriv
  Login     ${my_email}    ${my_pw}
Buy Lower
  wait until page does not contain element    //*[@class="chart-container__loader"]        timeout=60
  wait until page contains element    //*[@class="cq-chart-price"]     timeout=60
  click element    //*[@class="cq-chart-price"]
  Underlying
  Contract Type
  wait until page does not contain element    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]       timeout=60
  wait until page contains element       //*[@id="dt_purchase_put_button"]     timeout=60
  click element     //*[@id="dt_purchase_put_button"]



# Close Browser