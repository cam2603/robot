*** Settings ***

Resource    ../../../Resource/Common.resource
*** Variables ***
${MENU_BUTTON}       id:guide-button
${LOGO_ICON}       id:logo-icon
${SEARCH_BOX}       css:yt-searchbox[role="search"]
${SEARCH_INPUT}      name:search_query
${SEARCH_BUTTON}     css:button[aria-label="Search"]
${CLEAR_BUTTON}    css:.ytSearchboxComponentClearButtonWrapper button[aria-label="Clear search query"]
${VOICE_BUTTON}    id:voice-search-button
${TOOL_BUTTON}    css:button[id="button"][aria-label="Settings"]
${SETTINGS_MENU}    css:tp-yt-iron-dropdown
${SIGN_IN_BUTTON}    css:a[aria-label="Sign in"]
${ACCOUNT_AVATAR}    css:button#avatar-btn
${GUIDE_INNER}    id:guide-inner-content

*** Test Cases ***
TestHeaderIcon
    [Documentation]    Test header UI youtube
    Open Web
    Element Should Be Visible     ${MENU_BUTTON}
    Element Should Be Visible     ${LOGO_ICON}
    Element Should Be Visible     ${LOGO_ICON}    id:youtube-paths_yt10
    Element Should Be Visible     ${SEARCH_BOX}
    Element Should Be Visible     ${VOICE_BUTTON}
    Element Should Be Visible     ${TOOL_BUTTON}
    Element Should Not Be Visible    ${SETTINGS_MENU}
    Element Should Not Be Visible    ${GUIDE_INNER}
    Sleep    5s

TestSearch
    [Documentation]    Test UI and click search
    Open Web

    Click Element    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}       robot framework tutorial
    Press Keys    ${SEARCH_INPUT}       ENTER
    Page Should Contain    robot
    Element Should Be Visible    ${CLEAR_BUTTON}
    Sleep    5s

TestSearchVoice
    [Documentation]    Test voice search UI
    Open Web
    Click Element    ${VOICE_BUTTON}
    Sleep    3s
    Page Should Contain    microphone

TestClickTooltip
    [Documentation]    Test click tooltip
    Open Web
    Click Element    ${TOOL_BUTTON}
    Wait Until Element Is Visible    ${SETTINGS_MENU}    5s
    Element Should Be Visible    ${SETTINGS_MENU}
CheckLoginState
    Open Web

    ${login_status}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${ACCOUNT_AVATAR}

    IF    ${login_status}
        Log    User already logged in
    ELSE
        Log    User not logged in
    END
    
CheckClickGuideIcon
    Open Web
    Click Element    ${MENU_BUTTON}
    Wait Until Element Is Visible    ${MENU_BUTTON}    5s
    Element Should Be Visible    ${GUIDE_INNER}