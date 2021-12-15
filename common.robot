*** Settings ***
Documentation    Suite description
Library        SeleniumLibrary

*** Variables ***



*** Keyword ***

Login
  [arguments]    ${email}    ${pw}
  Open Browser  url=https://app.deriv.com   browser=chrome
  set window size    1280   1028
  wait until page does not contain element    dt_core_header_acc-info-preloader    timeout=60
  wait until page contains element    locator=${login_btn}  timeout=60
  click element   locator=${login_btn}
  wait until page contains element    ${email_field}     timeout=60
  input text    ${email_field}     ${email}
  input password    //*[@type="password"]    ${pw}
  click element    locator=//*[text()="Log in"]
