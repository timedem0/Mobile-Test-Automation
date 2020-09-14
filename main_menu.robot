*** Settings ***
Resource          resource/common.robot
Resource          resource/main_menu_resource.robot
Suite Setup       Start Application And Verify Welcome Page Is Displayed
Suite Teardown    Close Application
Test Setup        Login Using Correct Credentials
Documentation
...    User Story: TMT-2
...        As a User,
...        I want to be able to make a choice in the Main Menu,
...        So that I can play a game against AI
...    User Story: TMT-3
...        As a User,
...        I want to be able to make a choice in the Main Menu,
...        So that I can begin to search for another player


*** Test Cases ***
Two Play Versus AI Buttons Should Be Visible In Main Menu
    [Documentation]
    ...    TMT2-AC1
    ...    After logging in the App, are there two separate Play vs AI buttons visible in the main screen,
    ...    one for each difficulty level?
    [Tags]    main_menu    TMT-2
    [Teardown]    Log Out
    Verify That Two Play Versus AI Buttons Are Visible In Main Menu

It Is Possible To Choose To Play A Game Versus AI In Easy Mode
    [Documentation]
    ...    TMT2-AC2
    ...    After clicking each of the buttons, is the app correctly switching to the game screen,
    ...    for each separate difficulty level?
    [Tags]    main_menu    TMT-2
    [Teardown]    Leave Game Arena And Log Out
    Verify That Is Possible To Choose To Play A Game Versus AI In Easy Mode

It Is Possible To Choose To Play A Game Versus AI In Hard Mode
    [Documentation]
    ...    TMT2-AC2
    ...    After clicking each of the buttons, is the app correctly switching to the game screen,
    ...    for each separate difficulty level?
    [Tags]    main_menu    TMT-2
    [Teardown]    Leave Game Arena And Log Out
    Verify That Is Possible To Choose To Play A Game Versus AI In Hard Mode

It Is Possible To Choose To Play A Game Versus Another Player
    [Documentation]
    ...    TMT3-AC1
    ...    After logging in the App, is there a Play vs Another Player button visible in the main screen?
    ...    TMT3-AC2
    ...    Are there visual cues on the screen that the searching process is ongoing?
    ...    TMT3-AC3
    ...    Is it possible to stop the searching process at any time?
    [Tags]    main_menu    TMT-3
    [Teardown]    Log Out
    Verify That Is Possible To Choose To Play A Game Versus Another Player
