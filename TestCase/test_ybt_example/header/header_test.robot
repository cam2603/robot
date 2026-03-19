*** Settings ***
Resource    ../../../Resource/Common.resource
Suite Setup       Test-precondition
Suite Teardown    Test-postCondition

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