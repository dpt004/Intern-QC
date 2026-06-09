*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${STUDENT_TABLE}    xpath://section[contains(@class,"panel")][.//h2[normalize-space()="Danh sách sinh viên"]]//table
${IMPORT_FORM}      xpath://form[.//input[@type="file"]]
${IMPORT_FILE}      xpath://form[.//input[@type="file"]]//input[@type="file"]

*** Keywords ***
Student Table Should Be Visible
    Page Should Contain Element    ${STUDENT_TABLE}

Import Form Should Be Visible
    Page Should Contain Element    ${IMPORT_FORM}
    Page Should Contain Element    ${IMPORT_FILE}
