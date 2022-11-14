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
T301 Testing Homepage Link without login
    [Documentation]    It will Open EverNote Main Page
    Click Link    EverNote
    Page Should Contain    Welcome to EverNote


T302 HomepTesting posts page Link 
    [Documentation]    It will Open Blog Page
    Click Link    Posts
    Page Should Contain    BLOG POSTS !!!


*** Test Cases ***
T303 Verify Successful Login to EverNote
    [Documentation]    This test case verify that user named test3 is able to successfully login to the evernote app
    Click Link    Login
    Page Should Contain    Log In
    Input Text    id:email    test@test.com
    Input Password    id:password    password
    Click Element    id:submit
    Page Should Contain    Logged in Succesfully !
    Click Button    css:button[class="close"]


T304 Testing my posts page Link
    [Documentation]    It will Open my posts Page
    Click Link    My Posts
    Page Should Contain    Posts By 
    # Close Browser


T305 Testing specific post page Link
    [Documentation]    It will Open Blog Page
    Click Link    post3
    # Page Should Contain    post3 !!!


T306 testing Update the old post
    [Documentation]    This test case verifies that user can update his post after login
    Page Should Contain    Welcome to EverNote
    Click Link    Update
    Page Should Contain    Update Post !
    Input Text    id:title    Update post3
    Input Text    id:content     Hi, this is an updated post.
    Click Element    id:submit
    Page Should Contain    Your Post has been updated !
    # Click Button    css:button[class="close"]


*** Keywords ***
Go to Website
    [Documentation]    This test case verify user can visit the Website and view Blog/Posts
    Open Browser    ${URL}    ${Broswer}
    Page Should Contain    Welcome to EverNote