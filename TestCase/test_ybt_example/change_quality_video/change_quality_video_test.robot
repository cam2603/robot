*** Settings ***
Resource    ../../../Resource/Common.resource
Suite Setup       Test-precondition
Suite Teardown    Test-postCondition

*** Variables ***
${keyword}    baby shark
${quality}    720

*** Test Cases ***
TestChangeQualityVideo
    [Documentation]    Test change quality video
    Open Web
    TestSearhAndOpenVideo    ${keyword}
    Wait Until Element Is Visible    css=video    10s
    Sleep    3s
    Change Video Quality    ${quality}
    Sleep    10s