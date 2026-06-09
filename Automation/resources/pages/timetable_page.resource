*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMETABLE_WEEK_GRID}    css:.timetable-week-grid

*** Keywords ***
Timetable Week Grid Should Be Visible
    Page Should Contain Element    ${TIMETABLE_WEEK_GRID}
