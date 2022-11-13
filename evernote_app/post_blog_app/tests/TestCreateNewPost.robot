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

T102 Create New Post
    [Documentation]    This test case verifies that user can create a post after login
    Page Should Contain    Welcome to EverNote
    Click Link    New Post
    Page Should Contain    New Post !
    Input Text    id:title    We are testing our evernote app
    Input Text    id:content     We are testing our evernote app
    Click Element    id:submit
    Page Should Contain    Your post has been created !
    Click Button    css:button[class="close"]


T103 Tetst Logout Button
   [Documentation]  This test case varifies successful logout
    Click Link    Logout
    Location Should Be    ${URL}/home


# Kabi's test suite
T104 Homepage Link test_latest posts in Navigator
    [Documentation]    Go to Home Page
    Click Link    Home
    Page Should Contain    Welcome to EverNote

    Click Link    Latest Posts
    Location Should Be    ${URL}/evernote/latestposts
    Close Browser

*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote
