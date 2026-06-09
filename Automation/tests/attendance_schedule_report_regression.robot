*** Settings ***
Resource          ../resources/app.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Test Cases ***
TC_ATT_001 Attendance Page Is Ready For Marking
    [Documentation]    Verify admin can open attendance page and see filters and attendance area.
    [Tags]    regression    attendance
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Attendance Page Should Be Ready

TC_ATT_002 Attendance Can Be Filtered
    [Documentation]    Verify attendance filter action is available.
    [Tags]    regression    attendance    filter
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Filter Attendance

TC_ATT_LOCK_001 Attendance Lock Action Is Available For Admin
    [Documentation]    Verify lock action is exposed when attendance rows are available.
    [Tags]    regression    attendance    lock
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Attendance Lock Button Should Be Checked

TC_SCHEDULE_001 Schedule Assignment Page Is Available
    [Documentation]    Verify admin can open schedule assignment page and see required form fields.
    [Tags]    regression    schedule
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_SCHEDULES}
    Schedule Assignment Page Should Be Ready

TC_TIMETABLE_001 Teacher Can See Timetable
    [Documentation]    Verify teacher can open timetable week grid.
    [Tags]    regression    timetable    teacher
    Login With Credentials    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_TIMETABLE}
    Timetable Week Grid Should Be Visible

TC_TIMETABLE_002 Student Can See Timetable
    [Documentation]    Verify student can open timetable week grid.
    [Tags]    regression    timetable    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_TIMETABLE}
    Timetable Week Grid Should Be Visible

TC_REPORT_001 Admin Can Open Report Filters
    [Documentation]    Verify report page has filter inputs and action buttons.
    [Tags]    regression    reports
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_REPORTS}
    Report Filters Should Be Visible
    Admin Report Actions Should Be Visible

TC_REPORT_002 Student Can Open Own Report
    [Documentation]    Verify student can access report page without student-code filter.
    [Tags]    regression    reports    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_REPORTS}
    Report Filters Should Be Visible
    Student Report Should Not Have Student Code Filter
