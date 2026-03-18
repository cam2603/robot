*** Settings ***
Library    SeleniumLibrary
Library    DateTime
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
*** Keywords ***
TestSearch
    [Arguments]    ${keyword}
    Click Element    ${SEARCH_INPUT}
    Clear Element Text    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${keyword}
    Press Keys    ${SEARCH_INPUT}    ENTER
    Wait Until Page Contains    ${keyword}    10s
    Element Should Be Visible    ${CLEAR_BUTTON}
    Sleep    5s