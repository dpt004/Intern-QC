*** Settings ***
Library     SeleniumLibrary
Resource    ../common.resource
Resource    login_page.resource

*** Variables ***
${DASHBOARD}              css:.app-container
${LOGOUT_BUTTON}          css:.logout-btn
${SIDEBAR_NAV_BUTTONS}    css:.sidebar-nav button

*** Keywords ***
Dashboard Should Be Visible
    Wait Until Page Contains Element    ${DASHBOARD}
    Wait Until Page Contains Element    ${LOGOUT_BUTTON}

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
