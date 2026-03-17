*** Settings ***

Resource    ../../../Resource/Common.resource
*** Variables ***
${LOGO_ICON}       id:logo-icon
${SEARCH_BOX}       css:yt-searchbox[role="search"]
${SEARCH_INPUT}      name:search_query
${SEARCH_BUTTON}     css:button[aria-label="Search"]
${CLEAR_BUTTON}    css:.ytSearchboxComponentClearButtonWrapper button[aria-label="Clear search query"]
${VOICE_BUTTON}    id:voice-search-button
*** Test Cases ***
TestHeaderIcon
    [Documentation]    Test header UI youtube
    Open Web
    Element Should Be Visible     ${LOGO_ICON}
    Element Should Be Visible     ${LOGO_ICON}    id:youtube-paths_yt10
    Element Should Be Visible     ${SEARCH_BOX}
    Element Should Be Visible     ${VOICE_BUTTON}
    Sleep    5s

*** Test Cases ***
TestSearch
    [Documentation]    Test UI and click search
    Open Web

    Click Element    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}       robot framework tutorial
    Press Keys    ${SEARCH_INPUT}       ENTER
    Page Should Contain    robot
    Element Should Be Visible    ${CLEAR_BUTTON}
    Sleep    5s
