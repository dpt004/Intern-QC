*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CLASS_CODE_INPUT}    css:input[placeholder="Mã lớp"]
${CLASS_NAME_INPUT}    css:input[placeholder="Tên lớp"]
${CLASS_SUBMIT}        xpath://form[.//input[@placeholder="Mã lớp"]]//button[@type="submit"]

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
