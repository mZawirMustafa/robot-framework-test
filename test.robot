#Task 1

*** Settings ***

Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}  dt_login_button
${email_field}    name=email



*** Test Cases ***
Open Deriv
  Login     ${my_email}    ${my_pw}
  wait until page does not contain element    //*[@id="dt_core_header_acc-info-preloader"]      timeout=60
  wait until page contains element    dt_core_account-info_acc-info     timeout=60
  click element     dt_core_account-info_acc-info
  wait until page contains element    real_account_tab     timeout=60
  click element    //*[@id="real_account_tab"]

  #wait until page contains element    //*[text()="Real" and contains(@class,"active")]     timeout=60
  click element    //*[@id="dt_core_account-switcher_demo-tab"]

# Close Browser