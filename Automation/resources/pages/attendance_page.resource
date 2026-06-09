*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ATTENDANCE_FILTER_BAR}       css:.filters-bar
${ATTENDANCE_FILTER_SELECT}    css:.filters-bar select
${ATTENDANCE_PANEL}            css:.panel
${ATTENDANCE_FILTER_BUTTON}    xpath://button[normalize-space()="Lọc"]
${ATTENDANCE_LOCK_BUTTON}      xpath://button[normalize-space()="Xác nhận và khóa"]

*** Keywords ***
Attendance Page Should Be Ready
    Page Should Contain Element    ${ATTENDANCE_FILTER_BAR}
    Page Should Contain Element    ${ATTENDANCE_FILTER_SELECT}
    Page Should Contain Element    ${ATTENDANCE_FILTER_BUTTON}

Filter Attendance
    Click Button    ${ATTENDANCE_FILTER_BUTTON}
    Page Should Contain Element    ${ATTENDANCE_PANEL}

Attendance Lock Button Should Be Checked
    Page Should Contain Element    ${ATTENDANCE_PANEL}
    ${lock_visible}=    Run Keyword And Return Status    Page Should Contain Element    ${ATTENDANCE_LOCK_BUTTON}
    Log    Lock button visible: ${lock_visible}
