*** Settings ***
Resource    ../../Resource/Common.resource

*** Test Cases ***
Search Video On Youtube
    [Documentation]    Test search video function
    Open Web
    Input Text    name:search_query    robot framework tutorial
    Press Keys    name:search_query    ENTER
    Sleep    3s
    Page Should Contain    robot
    Close Web