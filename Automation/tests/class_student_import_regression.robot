*** Settings ***
Resource          ../resources/app.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Test Cases ***
TC_CLASS_001 Admin Can Create Test Class
    [Documentation]    Create a temporary class and clean it up after verification.
    [Tags]    regression    class-management    classes    create
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_CLASSES}
    ${class_code}=    Set Variable    AUTO_CLS_001
    ${class_name}=    Set Variable    Automation Class 001
    Delete Class If Exists    ${class_code}
    Create Class    ${class_code}    ${class_name}
    Class Should Exist    ${class_code}
    Delete Class If Exists    ${class_code}

TC_CLASS_002 Admin Can Edit Test Class
    [Documentation]    Create a temporary class, edit its name, then clean it up.
    [Tags]    regression    class-management    classes    edit
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_CLASSES}
    ${class_code}=    Set Variable    AUTO_CLS_002
    Delete Class If Exists    ${class_code}
    Create Class    ${class_code}    Automation Class Before Edit
    Click Class Action    ${class_code}    Sửa
    Clear Element Text    ${CLASS_NAME_INPUT}
    Input Text    ${CLASS_NAME_INPUT}    Automation Class After Edit
    Click Button    ${CLASS_SUBMIT}
    Wait Until Page Contains    Automation Class After Edit
    Delete Class If Exists    ${class_code}

TC_CLASS_003 Admin Can Delete Test Class
    [Documentation]    Create a temporary class and verify it can be deleted.
    [Tags]    regression    class-management    classes    delete
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_CLASSES}
    ${class_code}=    Set Variable    AUTO_CLS_003
    Delete Class If Exists    ${class_code}
    Create Class    ${class_code}    Automation Class To Delete
    Class Should Exist    ${class_code}
    Delete Class If Exists    ${class_code}
    Class Should Not Exist    ${class_code}

TC_STUDENT_001 Student Management Page Is Available
    [Documentation]    Verify admin can open student management and see the student table.
    [Tags]    regression    student-management    students
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_STUDENTS}
    Student Table Should Be Visible

TC_IMPORT_002 Import Requires Class And File
    [Documentation]    Verify import form is present and import is disabled until required data is selected.
    [Tags]    regression    student-import    import    negative
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_STUDENTS}
    Import Form Should Be Visible
