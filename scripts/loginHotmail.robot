*** Settings ***
Documentation    Test case file for robot framework workshop
Resource    ../keywords/loginHotmail.robot

*** Test Cases ***
Hotmail page - invalid user name validation
    open browser and go to hotmail
    verify elements are present
    enter invalid username
    click on next button
    verify that error message is displayed
    [Teardown]  close browser and report