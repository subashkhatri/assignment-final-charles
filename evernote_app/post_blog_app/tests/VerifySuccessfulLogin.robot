*** Settings ***
Documentation       Website Test

Library             SeleniumLibrary

Suite Setup         Go to Website
#Suite Teardown    Close Browser
Task Setup          Set Selenium Speed    0.3 seconds


*** Variables ***
${URL}          http://127.0.0.1:5000
${Broswer}      chrome


*** Test Cases ***
T101 Verify Successful Login to EverNote
    [Documentation]    This test case verifies that user is able to successfully login to the evernote app
    Click Link    Login
    Page Should Contain    Log In
    Input Text    id:email    test@test.com
    Input Password    id:password    password
    Click Element    id:submit
    Page Should Contain    Logged in Succesfully !
    Click Button    css:button[class="close"]
    Close Browser

*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote
