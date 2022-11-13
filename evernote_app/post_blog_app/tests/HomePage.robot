*** Settings ***
Documentation       Website Test

Library             SeleniumLibrary
Suite Setup         Go to Website
Suite Teardown    Close Browser
Task Setup          Set Selenium Speed    0.1 seconds


*** Variables ***
${URL}          http://127.0.0.1:5000
${Broswer}      chrome

*** Test Cases ***
T101 Homepage Link test_Evernote
    [Documentation]    Go to EverNote Page
    Click Link    EverNote
    Page Should Contain    Welcome to EverNote

T102 Homepage Link test_Home
    [Documentation]    Go to Home Page
    Click Link    Home
    Page Should Contain    Welcome to EverNote

T103 Homepage Link test_POST
    [Documentation]    Go to Post Page
    Click Link    Posts
    Location Should Be   ${URL}/posts

T103 Homepage Link test_Account
    [Documentation]    Go to Account Page (guest mode)
    Click Link    Account
    Location Should Be   ${URL}/login?next=%2Faccount

T104 Homepage Link test_Log in
    [Documentation]    Go to Log in Page (guest mode)
    Click Link    Login
    Location Should Be   ${URL}/login

T105 Homepage Link test_Register
    [Documentation]    Go to Register Page (guest mode)
    Click Link    Register
    Location Should be   ${URL}/register

T106 Homepage Link test_twitter
    [Documentation]    Go to twitter Page
    Click Outer-Link Image    Twitter Logo
    Outer Link Contain  https://twitter.com/SatabrataYo
    Switch Window  Main

T107 Homepage Link test_Linkedin
    [Documentation]    This is to go to linkedin Page
    Click Outer-Link Image    Linkedin Logo
    Outer Link Contain  https://www.linkedin.com/
    Switch Window  Main

T108 Homepage Link test_Facebook
    [Documentation]    This is to go to Facebook Page
    Click Outer-Link Image    Facebook Logo
    Outer Link Contain  https://www.facebook.com/satabrata.paul
    Switch Window  Main

T109 Homepage Link test_Github
    [Documentation]    This is to go to Github Page
    Click Outer-Link Image    Github-logo
    Outer Link Contain  https://github.com/SatabrataPaul-GitAc/EverNote_application
    Switch Window  Main


*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote

Click Outer-Link Image
    [Arguments]  ${image_name}
    Click image  ${image_name}
    switch window  New

Outer Link Contain
    [Arguments]  ${image_url}
    Location Should Contain    ${image_url}


