*** Settings ***
Resource          ../resources/common.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Test Cases ***
TC_LOGIN_001 Admin Login Successfully
    [Documentation]    Verify admin can login and see dashboard.
    [Tags]    smoke    login    admin
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible

TC_LOGIN_002 Teacher Login Successfully
    [Documentation]    Verify teacher can login and see dashboard.
    [Tags]    smoke    login    teacher
    Login With Credentials    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Dashboard Should Be Visible

TC_LOGIN_003 Student Login Successfully
    [Documentation]    Verify student can login and see dashboard.
    [Tags]    smoke    login    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible

TC_LOGIN_004 Invalid Password Cannot Login
    [Documentation]    Verify user cannot login with an invalid password.
    [Tags]    smoke    negative    login
    Login With Credentials    ${ADMIN_USERNAME}    wrong-password
    Login Page Should Be Visible
    Page Should Not Contain Element    ${DASHBOARD}

TC_LOGIN_005 Empty Username Or Password Cannot Login
    [Documentation]    Verify empty login form cannot open dashboard.
    [Tags]    smoke    negative    login
    Clear Element Text    ${USERNAME_INPUT}
    Clear Element Text    ${PASSWORD_INPUT}
    Click Button    ${LOGIN_BUTTON}
    Login Page Should Be Visible
    Page Should Not Contain Element    ${DASHBOARD}

TC_LOGOUT_001 Admin Logout Successfully
    [Documentation]    Verify logout returns user to login page.
    [Tags]    smoke    logout
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Logout From System
