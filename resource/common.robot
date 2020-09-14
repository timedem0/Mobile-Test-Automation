*** Settings ***
Library    AppiumLibrary
Library    ../library/HelperLibrary.py


*** Variables ***
${APPIUM_SERVER}        http://127.0.0.1:4723/wd/hub
${WELCOME_PAGE_TEXT}    Nuke-Foot-Cockroach
${MAIN_MENU_TEXT}       Hello
${GAME_SCREEN_TEXT}     Gaming Arena
${TEST_USER}            testuser@test.com
${TEST_PASSWORD}        abcd_1234
${USERNAME_INPUT}       //android.widget.EditText[@password = 'false']
${PASSWORD_INPUT}       //android.widget.EditText[@password = 'true']
${SIGN_UP_BUTTON}       //android.widget.TextView[contains(@text, 'Sign Up')]
${LOG_IN_BUTTON}        //android.widget.TextView[contains(@text, 'Log In')]
${LOG_OUT_BUTTON}       //android.widget.TextView[contains(@text, 'Log Out')]


*** Keywords ***
Start Application And Verify Welcome Page Is Displayed
    &{desired_capabilities}    HelperLibrary.Get Desired Capabilities
    Open Application    ${APPIUM_SERVER}    &{desired_capabilities}
    Wait Until Page Contains    ${WELCOME_PAGE_TEXT}

Login Using Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOG_IN_BUTTON}

Login Using Correct Credentials
    Login Using Credentials     ${TEST_USER}    ${TEST_PASSWORD}
    Wait Until Page Contains    ${MAIN_MENU_TEXT}
    Wait Until Page Contains Element    ${LOG_OUT_BUTTON}

Log Out
    Click Element    ${LOG_OUT_BUTTON}
    Wait Until Page Contains    ${WELCOME_PAGE_TEXT}
