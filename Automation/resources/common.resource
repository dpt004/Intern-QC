*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}            https://sasdau.vercel.app/
${BROWSER}             Chrome
${SELENIUM_TIMEOUT}    10s

${ADMIN_USERNAME}      admin
${ADMIN_PASSWORD}      Admin@123
${ADMIN_ROLE}          Quản trị hệ thống
${TEACHER_USERNAME}    teacher
${TEACHER_PASSWORD}    Teacher@123
${TEACHER_ROLE}        Giảng viên
${STUDENT_USERNAME}    student
${STUDENT_PASSWORD}    Student@123
${STUDENT_ROLE}        Sinh viên demo

${MENU_TIMETABLE}      Thời khóa biểu
${MENU_ATTENDANCE}     Điểm danh
${MENU_HISTORY}        Lịch sử
${MENU_STUDENTS}       Sinh viên
${MENU_CLASSES}        Lớp
${MENU_SCHEDULES}      Phân công tiết
${MENU_REPORTS}        Báo cáo

*** Keywords ***
Open Browser To Base Url
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}

Close Test Browser
    Close Browser
