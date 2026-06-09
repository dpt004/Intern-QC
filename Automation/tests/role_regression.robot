*** Settings ***
Resource          ../resources/app.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Test Cases ***
TC_ROLE_001 Admin Can See Management Menus
    [Documentation]    Verify admin can see all management menus.
    [Tags]    regression    role    admin
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Sidebar Menu Count Should Be    6
    Sidebar Menu Should Contain    ${MENU_TIMETABLE}
    Sidebar Menu Should Contain    ${MENU_ATTENDANCE}
    Sidebar Menu Should Contain    ${MENU_STUDENTS}
    Sidebar Menu Should Contain    ${MENU_CLASSES}
    Sidebar Menu Should Contain    ${MENU_SCHEDULES}
    Sidebar Menu Should Contain    ${MENU_REPORTS}

TC_ROLE_002 Teacher Cannot See Admin Management Menus
    [Documentation]    Verify teacher cannot see classes and schedule assignment menus.
    [Tags]    regression    role    teacher
    Login With Credentials    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Dashboard Should Be Visible
    Sidebar Menu Count Should Be    4
    Sidebar Menu Should Contain    ${MENU_TIMETABLE}
    Sidebar Menu Should Contain    ${MENU_ATTENDANCE}
    Sidebar Menu Should Contain    ${MENU_STUDENTS}
    Sidebar Menu Should Contain    ${MENU_REPORTS}
    Sidebar Menu Should Not Contain    ${MENU_CLASSES}
    Sidebar Menu Should Not Contain    ${MENU_SCHEDULES}

TC_ROLE_003 Student Has Read Only Menus
    [Documentation]    Verify student only sees read-only menus.
    [Tags]    regression    role    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible
    Sidebar Menu Count Should Be    3
    Sidebar Menu Should Contain    ${MENU_TIMETABLE}
    Sidebar Menu Should Contain    ${MENU_HISTORY}
    Sidebar Menu Should Contain    ${MENU_REPORTS}
    Sidebar Menu Should Not Contain    ${MENU_STUDENTS}
    Sidebar Menu Should Not Contain    ${MENU_CLASSES}
    Sidebar Menu Should Not Contain    ${MENU_SCHEDULES}
