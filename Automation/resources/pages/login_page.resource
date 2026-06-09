*** Settings ***
Library     SeleniumLibrary
Resource    ../common.resource

*** Variables ***
${USERNAME_INPUT}    css:input[autocomplete="username"]
${PASSWORD_INPUT}    css:input[autocomplete="current-password"]
${LOGIN_BUTTON}      css:button[type="submit"]

*** Keywords ***
Open Login Page
    Open Browser To Base Url
    Login Page Should Be Visible

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_INPUT}
    Clear Element Text    ${USERNAME_INPUT}
    Input Text    ${USERNAME_INPUT}    ${username}
    Clear Element Text    ${PASSWORD_INPUT}
    Input Password    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Login Page Should Be Visible
    Wait Until Page Contains Element    ${USERNAME_INPUT}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}

Login Page Should Not Be Visible As Dashboard
    Page Should Not Contain Element    ${DASHBOARD}
    Page Should Contain Element    ${USERNAME_INPUT}
