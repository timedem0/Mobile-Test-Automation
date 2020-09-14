*** Settings ***
Resource          resource/common.robot
Resource          resource/authentication_resource.robot
Suite Setup       Start Application And Verify Welcome Page Is Displayed
Suite Teardown    Close Application
Documentation
...    User Story: TMT-1
...        As a User,
...        I want to be able to input my credentials,
...        So that I can log into the App


*** Test Cases ***
It Is Possible To Log In With Correct Credentials
    [Documentation]
    ...    TMT1-AC1
    ...    Is it possible to log into the App using correct credentials?
    [Tags]    authentication    TMT-1
    [Teardown]    Log Out
    It Should Be Possible To Log In With Correct Credentials

It Is Not Possible To Log In If The Email Was Not Registered
    [Documentation]
    ...    TMT1-AC2
    ...    Is the user prevented to log into the App with an unregistered email address
    ...    and is there a descriptive error message?
    [Tags]    authentication    error_handling    TMT-1
    It Should Not Be Possible To Log In If The Email Was Not Registered

It Is Not Possible To Log In Using Badly Formatted Email
    [Documentation]
    ...    TMT1-AC3
    ...    Is the user prevented to log into the App with a badly formatted email address
    ...    and is there a descriptive error message?
    [Tags]    authentication    error_handling    TMT-1
    It Should Not Be Possible To Log In Using Badly Formatted Email

It Is Not Possible To Log In Using A Wrong Password
    [Documentation]
    ...    TMT1-AC4
    ...    Is the user prevented to log into the App with a wrong password
    ...    and is there a descriptive error message?
    [Tags]    authentication    error_handling    TMT-1
    It Should Not Be Possible To Log In Using A Wrong Password
