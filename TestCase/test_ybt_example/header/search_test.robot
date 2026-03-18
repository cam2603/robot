*** Settings ***
Library    OperatingSystem
Library    String
Resource   ../../../Resource/Common.resource

*** Variables ***
${SEARCH_FILE}    C:/Users/Public/hằng/hang_robot_test/TestCase/DBFile/text_search_file.txt

*** Test Cases ***
TestSearchLoop
    [Documentation]    Test search with multiple keywords
    Open Web

    ${search_list}=    Get File    ${SEARCH_FILE}
    @{search_keywords}=    Split To Lines    ${search_list}

    FOR    ${keyword}    IN    @{search_keywords}
        TestSearch    ${keyword}
    END




