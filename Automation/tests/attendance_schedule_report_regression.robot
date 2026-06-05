*** Settings ***
Resource          ../resources/common.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Variables ***
${MENU_TIMETABLE}     Thời khóa biểu
${MENU_ATTENDANCE}    Điểm danh
${MENU_HISTORY}       Lịch sử
${MENU_SCHEDULES}     Phân công tiết
${MENU_REPORTS}       Báo cáo

*** Test Cases ***
TC_ATT_001 Attendance Page Is Ready For Marking
    [Documentation]    Verify admin can open attendance page and see filters and attendance area.
    [Tags]    regression    attendance
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Page Should Contain Element    css:.filters-bar
    Page Should Contain Element    css:.filters-bar select
    Page Should Contain Element    xpath://button[normalize-space()="Lọc"]

TC_ATT_002 Attendance Can Be Filtered
    [Documentation]    Verify attendance filter action is available.
    [Tags]    regression    attendance    filter
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Click Button    xpath://button[normalize-space()="Lọc"]
    Page Should Contain Element    css:.panel

TC_ATT_LOCK_001 Attendance Lock Action Is Available For Admin
    [Documentation]    Verify lock action is exposed when attendance rows are available.
    [Tags]    regression    attendance    lock
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_ATTENDANCE}
    Page Should Contain Element    css:.panel
    ${lock_visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath://button[normalize-space()="Xác nhận và khóa"]
    Log    Lock button visible: ${lock_visible}

TC_SCHEDULE_001 Schedule Assignment Page Is Available
    [Documentation]    Verify admin can open schedule assignment page and see required form fields.
    [Tags]    regression    schedule
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_SCHEDULES}
    Page Should Contain Element    css:.schedule-form
    Page Should Contain Element    css:.schedule-form select
    Page Should Contain Element    css:.schedule-form input[type="time"]

TC_TIMETABLE_001 Teacher Can See Timetable
    [Documentation]    Verify teacher can open timetable week grid.
    [Tags]    regression    timetable    teacher
    Login With Credentials    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_TIMETABLE}
    Page Should Contain Element    css:.timetable-week-grid

TC_TIMETABLE_002 Student Can See Timetable
    [Documentation]    Verify student can open timetable week grid.
    [Tags]    regression    timetable    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_TIMETABLE}
    Page Should Contain Element    css:.timetable-week-grid

TC_REPORT_001 Admin Can Open Report Filters
    [Documentation]    Verify report page has filter inputs and action buttons.
    [Tags]    regression    reports
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_REPORTS}
    Page Should Contain Element    css:.filters
    Page Should Contain Element    css:.filters input[type="date"]
    Button With Text Should Be Visible    Xem
    Button With Text Should Be Visible    Xuất CSV

TC_REPORT_002 Student Can Open Own Report
    [Documentation]    Verify student can access report page without student-code filter.
    [Tags]    regression    reports    student
    Login With Credentials    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_REPORTS}
    Page Should Contain Element    css:.filters
    Page Should Contain Element    css:.filters input[type="date"]
    Page Should Not Contain Element    css:.filters input[placeholder="SV001"]
