*** Settings ***
Documentation       Website Test

Library             SeleniumLibrary
Suite Setup         Go to Website
Suite Teardown    Close Browser
Task Setup          Set Selenium Speed    0.3 seconds


*** Variables ***
${URL}          http://127.0.0.1:5000
${Broswer}      chrome

*** Test Cases ***
T101 Homepage Link test_Home
    [Documentation]    Go to Home Page
    Click Link    Home
    Page Should Contain    Welcome to EverNote

T102 Homepage Link test_guest_user_post_page
    [Documentation]    Go to Post Page
    Click Link    Posts
    Location Should Be    http://127.0.0.1:5000/posts



*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote