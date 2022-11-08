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
T101 Homepage Link test_Evernote
    [Documentation]    This is to go to EverNote Page
    Click Link    EverNote
    Page Should Contain    Welcome to EverNote

T102 Homepage Link test_Posts
    [Documentation]    This is to go to EverNote Page
    Click Link    Posts
    Page Should Contain    BLOG POSTS !!!
    Close Browser


*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote
