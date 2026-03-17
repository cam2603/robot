*** Settings ***
Resource    ../../Resource/Common.resource

Suite Setup     Test-precondition
Suite Teardown   Test-postCondition

*** Test Cases ***
Open Youtube Website
    [Documentation]    Test open youtube
    [Setup]    Test-precondition
    Open Web
    Sleep    5s
    Title Should Be    YouTube
    Close Web
    [Teardown]    Test-postCondition

*** Test Cases ***
Test Timeout
    ${start}=    Log Execution Time

    Open Web
    Sleep    5s
    Close Web
    Log Duration    ${start}