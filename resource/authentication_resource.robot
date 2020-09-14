*** Variables ***
${BAD_USER_ERROR_MESSAGE}
...    //android.widget.TextView[contains(@text, 'There is no user record corresponding to this identifier')]
${BAD_EMAIL_ERROR_MESSAGE}
...    //android.widget.TextView[contains(@text, 'The email address is badly formatted')]
${BAD_PASSWORD_ERROR_MESSAGE}
...    //android.widget.TextView[contains(@text, 'The password is invalid')]


*** Keywords ***
It Should Be Possible To Log In With Correct Credentials
    Start Screen Recording
    Login Using Correct Credentials
    Capture Timestamped Screenshot With Test Name

It Should Not Be Possible To Log In If The Email Was Not Registered
    Login Using Credentials     dummy_user@dummy.com    dummy
    Wait Until Page Contains    ${WELCOME_PAGE_TEXT}
    Page Should Contain Element    ${BAD_USER_ERROR_MESSAGE}
    Capture Timestamped Screenshot With Test Name

It Should Not Be Possible To Log In Using Badly Formatted Email
    Login Using Credentials     bad_email    bad_password
    Wait Until Page Contains    ${WELCOME_PAGE_TEXT}
    Page Should Contain Element    ${BAD_EMAIL_ERROR_MESSAGE}
    Capture Timestamped Screenshot With Test Name

It Should Not Be Possible To Log In Using A Wrong Password
    Start Screen Recording
    Login Using Credentials     ${TEST_USER}    bad_password
    Wait Until Page Contains    ${WELCOME_PAGE_TEXT}
    Page Should Contain Element    ${BAD_PASSWORD_ERROR_MESSAGE}
    Capture Timestamped Screenshot With Test Name
