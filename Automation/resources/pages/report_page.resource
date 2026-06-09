*** Settings ***
Library     SeleniumLibrary
Resource    dashboard_page.resource

*** Variables ***
${REPORT_FILTERS}           css:.filters
${REPORT_DATE_INPUT}        css:.filters input[type="date"]
${REPORT_STUDENT_FILTER}    css:.filters input[placeholder="SV001"]

*** Keywords ***
Report Filters Should Be Visible
    Page Should Contain Element    ${REPORT_FILTERS}
    Page Should Contain Element    ${REPORT_DATE_INPUT}

Admin Report Actions Should Be Visible
    Button With Text Should Be Visible    Xem
    Button With Text Should Be Visible    Xuất CSV

Student Report Should Not Have Student Code Filter
    Page Should Not Contain Element    ${REPORT_STUDENT_FILTER}
