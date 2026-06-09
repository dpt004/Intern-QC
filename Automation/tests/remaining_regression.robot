*** Settings ***
Resource          ../resources/app.resource
Library           String
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Test Cases ***
TC_REGISTER_001 Teacher Can Register With Unique Username
    [Documentation]    Create a unique teacher account and verify registration opens dashboard.
    [Tags]    regression    register    teacher
    ${suffix}=    Generate Random String    6    [LOWER][NUMBERS]
    Open Register Form
    Fill Register Form    teacher_auto_${suffix}    Automation Teacher ${suffix}    Teacher@123
    Select Teacher Role For Register
    Submit Register Form
    Dashboard Should Be Visible

TC_REGISTER_002 Student Can Register With Unique Username
    [Documentation]    Create a unique student account and verify registration opens dashboard.
    [Tags]    regression    register    student
    ${suffix}=    Generate Random String    6    [LOWER][NUMBERS]
    Open Register Form
    Fill Register Form    student_auto_${suffix}    Automation Student ${suffix}    Student@123
    Select Student Role For Register
    Submit Register Form
    Dashboard Should Be Visible

TC_REGISTER_003 Duplicate Username Cannot Register
    [Documentation]    Verify existing username cannot be registered again.
    [Tags]    regression    register    negative
    Open Register Form
    Fill Register Form    admin    Duplicate Admin    Admin@123
    Submit Register Form
    Login Page Should Not Be Visible As Dashboard

TC_REGISTER_004 Short Password Cannot Register
    [Documentation]    Verify password shorter than 6 characters cannot register.
    [Tags]    regression    register    negative
    ${suffix}=    Generate Random String    6    [LOWER][NUMBERS]
    Open Register Form
    Fill Register Form    short_pw_${suffix}    Short Password User    12345
    Submit Register Form
    Login Page Should Not Be Visible As Dashboard

TC_STUDENT_002 Admin Can Update Auto Student
    [Documentation]    Create a test student via API, update it, verify response, then clean up.
    [Tags]    regression    students    update
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Student Update Flow
    Should Be Equal    ${result}    PASS

TC_STUDENT_003 Admin Can Delete Auto Student
    [Documentation]    Create a test student via API, delete it, and verify it is removed.
    [Tags]    regression    students    delete
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Student Delete Flow
    Should Be Equal    ${result}    PASS

TC_IMPORT_001 Admin Can Import Valid Student Csv
    [Documentation]    Upload a valid CSV sample into the selected class.
    [Tags]    regression    import
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Import Flow
    Should Be Equal    ${result}    PASS

TC_SCHEDULE_002 Admin Can Update Auto Schedule
    [Documentation]    Create a test schedule via API, update it, verify response, then clean up.
    [Tags]    regression    schedule    update
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Schedule Update Flow
    Should Be Equal    ${result}    PASS

TC_SCHEDULE_003 Admin Can Delete Auto Schedule
    [Documentation]    Create a test schedule via API, delete it, and verify it is removed.
    [Tags]    regression    schedule    delete
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Schedule Delete Flow
    Should Be Equal    ${result}    PASS

TC_REPORT_003 Attendance Report Csv Can Be Exported
    [Documentation]    Create attendance data through API, export CSV, and verify expected content exists.
    [Tags]    regression    reports    export
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    ${result}=    Execute Auto Report Export Flow
    Should Be Equal    ${result}    PASS
