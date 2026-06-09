*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SCHEDULE_FORM}          css:.schedule-form
${SCHEDULE_SELECT}        css:.schedule-form select
${SCHEDULE_TIME_INPUT}    css:.schedule-form input[type="time"]

*** Keywords ***
Schedule Assignment Page Should Be Ready
    Page Should Contain Element    ${SCHEDULE_FORM}
    Page Should Contain Element    ${SCHEDULE_SELECT}
    Page Should Contain Element    ${SCHEDULE_TIME_INPUT}
