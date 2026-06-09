*** Settings ***
Library     SeleniumLibrary
Resource    ../common.resource

*** Variables ***
${REGISTER_TOGGLE}      css:.toggle-auth-btn
${REGISTER_FULLNAME}    xpath://form[contains(@class,"login-panel")]//input[1]
${REGISTER_USERNAME}    css:input[autocomplete="username"]
${REGISTER_PASSWORD}    css:input[autocomplete="new-password"]
${REGISTER_SUBMIT}      xpath://form[contains(@class,"login-panel")]//button[@type="submit"]
${REGISTER_TEACHER}     xpath://form[contains(@class,"login-panel")]//button[@type="button"][1]
${REGISTER_STUDENT}     xpath://form[contains(@class,"login-panel")]//button[@type="button"][2]

*** Keywords ***
Open Register Form
    Click Element    ${REGISTER_TOGGLE}
    Wait Until Page Contains Element    ${REGISTER_PASSWORD}

Fill Register Form
    [Arguments]    ${username}    ${full_name}    ${password}
    Clear Element Text    ${REGISTER_FULLNAME}
    Input Text    ${REGISTER_FULLNAME}    ${full_name}
    Clear Element Text    ${REGISTER_USERNAME}
    Input Text    ${REGISTER_USERNAME}    ${username}
    Clear Element Text    ${REGISTER_PASSWORD}
    Input Password    ${REGISTER_PASSWORD}    ${password}

Select Teacher Role For Register
    Click Element    ${REGISTER_TEACHER}

Select Student Role For Register
    Click Element    ${REGISTER_STUDENT}

Submit Register Form
    Click Button    ${REGISTER_SUBMIT}
