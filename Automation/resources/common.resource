*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}            https://sasdau.vercel.app/
${BROWSER}             Chrome
${SELENIUM_TIMEOUT}    10s

${ADMIN_USERNAME}      admin
${ADMIN_PASSWORD}      Admin@123
${ADMIN_ROLE}          Quản trị hệ thống
${TEACHER_USERNAME}    teacher
${TEACHER_PASSWORD}    Teacher@123
${TEACHER_ROLE}        Giảng viên
${STUDENT_USERNAME}    student
${STUDENT_PASSWORD}    Student@123
${STUDENT_ROLE}        Sinh viên demo

${USERNAME_INPUT}      css:input[autocomplete="username"]
${PASSWORD_INPUT}      css:input[autocomplete="current-password"]
${LOGIN_BUTTON}        css:button[type="submit"]
${DASHBOARD}           css:.app-container
${LOGOUT_BUTTON}       css:.logout-btn
${SIDEBAR_NAV_BUTTONS}    css:.sidebar-nav button

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Wait Until Page Contains Element    ${USERNAME_INPUT}

Close Test Browser
    Close Browser

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_INPUT}
    Clear Element Text    ${USERNAME_INPUT}
    Input Text    ${USERNAME_INPUT}    ${username}
    Clear Element Text    ${PASSWORD_INPUT}
    Input Password    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Dashboard Should Be Visible
    Wait Until Page Contains Element    ${DASHBOARD}
    Wait Until Page Contains Element    ${LOGOUT_BUTTON}

Login Page Should Be Visible
    Wait Until Page Contains Element    ${USERNAME_INPUT}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}

Logout From System
    Click Button    ${LOGOUT_BUTTON}
    Login Page Should Be Visible

Sidebar Menu Count Should Be
    [Arguments]    ${expected_count}
    Wait Until Page Contains Element    ${SIDEBAR_NAV_BUTTONS}
    ${actual_count}=    Get Element Count    ${SIDEBAR_NAV_BUTTONS}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

Sidebar Menu Should Contain
    [Arguments]    ${menu_text}
    Page Should Contain Element    xpath://nav[contains(@class,"sidebar-nav")]//button[.//span[normalize-space()="${menu_text}"]]

Sidebar Menu Should Not Contain
    [Arguments]    ${menu_text}
    Page Should Not Contain Element    xpath://nav[contains(@class,"sidebar-nav")]//button[.//span[normalize-space()="${menu_text}"]]

Click Sidebar Menu
    [Arguments]    ${menu_text}
    Click Element    xpath://nav[contains(@class,"sidebar-nav")]//button[.//span[normalize-space()="${menu_text}"]]

Button With Text Should Be Visible
    [Arguments]    ${button_text}
    Page Should Contain Element    xpath://button[normalize-space()="${button_text}"]

Panel Should Contain Heading
    [Arguments]    ${heading_text}
    Page Should Contain Element    xpath://section[contains(@class,"panel")][.//h2[normalize-space()="${heading_text}"]]

Table Should Be Visible
    Page Should Contain Element    css:table
