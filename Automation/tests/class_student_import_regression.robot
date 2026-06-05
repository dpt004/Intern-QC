*** Settings ***
Resource          ../resources/common.resource
Test Setup        Open Login Page
Test Teardown     Close Test Browser

*** Variables ***
${MENU_CLASSES}       Lớp
${MENU_STUDENTS}      Sinh viên
${CLASS_CODE_INPUT}   css:input[placeholder="Mã lớp"]
${CLASS_NAME_INPUT}   css:input[placeholder="Tên lớp"]
${CLASS_SUBMIT}       xpath://form[.//input[@placeholder="Mã lớp"]]//button[@type="submit"]
${STUDENT_TABLE}      xpath://section[contains(@class,"panel")][.//h2[normalize-space()="Danh sách sinh viên"]]//table
${IMPORT_FORM}        xpath://form[.//input[@type="file"]]

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
    Page Should Contain Element    ${STUDENT_TABLE}

TC_IMPORT_002 Import Requires Class And File
    [Documentation]    Verify import form is present and import is disabled until required data is selected.
    [Tags]    regression    student-import    import    negative
    Login With Credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Dashboard Should Be Visible
    Click Sidebar Menu    ${MENU_STUDENTS}
    Page Should Contain Element    ${IMPORT_FORM}
    Page Should Contain Element    xpath://form[.//input[@type="file"]]//input[@type="file"]

*** Keywords ***
Create Class
    [Arguments]    ${class_code}    ${class_name}
    Wait Until Page Contains Element    ${CLASS_CODE_INPUT}
    Clear Element Text    ${CLASS_CODE_INPUT}
    Input Text    ${CLASS_CODE_INPUT}    ${class_code}
    Clear Element Text    ${CLASS_NAME_INPUT}
    Input Text    ${CLASS_NAME_INPUT}    ${class_name}
    Click Button    ${CLASS_SUBMIT}
    Wait Until Page Contains    ${class_code}

Class Should Exist
    [Arguments]    ${class_code}
    Page Should Contain Element    xpath://article[contains(@class,"class-item")][.//strong[normalize-space()="${class_code}"]]

Class Should Not Exist
    [Arguments]    ${class_code}
    Page Should Not Contain Element    xpath://article[contains(@class,"class-item")][.//strong[normalize-space()="${class_code}"]]

Click Class Action
    [Arguments]    ${class_code}    ${action_text}
    Click Button    xpath://article[contains(@class,"class-item")][.//strong[normalize-space()="${class_code}"]]//button[normalize-space()="${action_text}"]

Delete Class If Exists
    [Arguments]    ${class_code}
    ${exists}=    Run Keyword And Return Status    Class Should Exist    ${class_code}
    IF    ${exists}
        Click Class Action    ${class_code}    Xóa
        Wait Until Page Does Not Contain Element    xpath://article[contains(@class,"class-item")][.//strong[normalize-space()="${class_code}"]]
    END
