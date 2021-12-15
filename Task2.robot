#Task 2

*** Settings ***

Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}  dt_login_button
${email_field}    name=email



*** Test Cases ***
Open Deriv
  Login     ${my_email}    ${my_pw}
Buyrise
  wait until page does not contain element    //*[@class="chart-container__loader"]        timeout=60
  wait until page contains element    //*[@class="cq-chart-price"]     timeout=60
  click element    //*[@class="cq-chart-price"]
  wait until page contains element    //*[text()="Synthetic Indices"]     timeout=60
  click element    //*[text()="Synthetic Indices"]
  wait until page contains element    //*[text()="Volatility 10 (1s) Index"]     timeout=60
  click element    //*[text()="Volatility 10 (1s) Index"]
  wait until page does not contain element    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]    timeout=60
  wait until page contains element       dt_purchase_call_button     timeout=60
  click element     dt_purchase_call_button

# Close Browser