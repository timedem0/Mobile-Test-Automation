*** Variables ***
${PLAY_VS_AI_EASY_BUTTON}    //android.widget.TextView[contains(@text, 'Play vs AI Easy')]
${PLAY_VS_AI_HARD_BUTTON}    //android.widget.TextView[contains(@text, 'Play vs AI Hard')]
${PLAY_VS_ANOTHER_PLAYER}    //android.widget.TextView[contains(@text, 'Play against a Human player')]
${LEAVE_GAME_BUTTON}         //android.widget.TextView[contains(@text, 'Leave Game')]
${STOP_SEARCHING_BUTTON}     //android.widget.TextView[contains(@text, 'Stop searching')]
${SEARCHING_SPINNER}         //android.widget.ProgressBar
${SEARCHING_TEXT}            Searching for a match...
${AI_EASY_NAME}    Hal
${AI_HARD_NAME}    Nightflyer


*** Keywords ***
Verify That Two Play Versus AI Buttons Are Visible In Main Menu
    Page Should Contain Element    ${PLAY_VS_AI_EASY_BUTTON}
    Page Should Contain Element    ${PLAY_VS_AI_HARD_BUTTON}
    Capture Timestamped Screenshot With Test Name

Verify That Is Possible To Choose To Play A Game Versus AI In Easy Mode
    Click Element    ${PLAY_VS_AI_EASY_BUTTON}
    Wait Until Page Contains    ${GAME_SCREEN_TEXT}
    Page Should Contain Text    ${AI_EASY_NAME}
    Capture Timestamped Screenshot With Test Name

Verify That Is Possible To Choose To Play A Game Versus AI In Hard Mode
    Click Element    ${PLAY_VS_AI_HARD_BUTTON}
    Wait Until Page Contains    ${GAME_SCREEN_TEXT}
    Page Should Contain Text    ${AI_HARD_NAME}
    Capture Timestamped Screenshot With Test Name

Verify That Is Possible To Choose To Play A Game Versus Another Player
    HelperLibrary.Toggle WiFi
    Click Element    ${PLAY_VS_ANOTHER_PLAYER}
    Page Should Contain Element    ${SEARCHING_SPINNER}
    Page Should Contain Text       ${SEARCHING_TEXT}
    Capture Timestamped Screenshot With Test Name
    ${random_wait_time}    HelperLibrary.Get Random Integer    1    10
    Sleep    ${random_wait_time}    Simulating a random wait time
    Click Element    ${STOP_SEARCHING_BUTTON}
    Page Should Not Contain Element    ${SEARCHING_SPINNER}
    Page Should Not Contain Text       ${SEARCHING_TEXT}
    Page Should Contain Element        ${PLAY_VS_ANOTHER_PLAYER}
    HelperLibrary.Toggle WiFi

Leave Game Arena And Log Out
    Click Element    ${LEAVE_GAME_BUTTON}
    Wait Until Page Contains    ${MAIN_MENU_TEXT}
    Log Out
