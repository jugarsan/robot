*** Settings ***
Documentation   Includes all the keywords necessary to run loginHotmail test
Resource  ../elements/loginHotmail.robot
Library  Selenium2Library    timeout=15    implicit_wait=5

*** Keywords ***
open browser and go to hotmail
    open browser    https://www.hotmail.com    chrome
    maximize browser window

verify elements are present
    wait until keyword succeeds    10 sec    5 sec    page should contain element    ${header_label}
    wait until keyword succeeds    10 sec    5 sec    element text should be    ${header_label}    Sign in
    wait until keyword succeeds    10 sec    5 sec    page should contain element    ${username_input}
    wait until keyword succeeds    10 sec    5 sec    page should contain element    ${next_button}

enter invalid username
    wait until keyword succeeds    10 sec    5 sec    input text    ${username_input}    asdfafsdfd@sss

click on next button
    wait until keyword succeeds    10 sec    5 sec    click element    ${next_button}

verify that error message is displayed
    wait until keyword succeeds    10 sec    5 sec    page should contain element    ${usernameError_label}
    wait until keyword succeeds    10 sec    5 sec    element text should be    ${usernameError_label}    Please enter a valid email address, phone number, or Skype name.

close browser and report
    close all browsers