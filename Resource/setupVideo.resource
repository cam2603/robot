*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${SETTING_BUTTON}       css=button.ytp-button.ytp-settings-button
${SETTING_MENU}      css=.ytp-settings-menu
${SKIP_BUTTON}      css=.ytp-ad-skip-button
${VIDEO}      css=video
${QUALITY_BUTTON}      xpath=//div[@role='menuitem'][.//div[text()='Quality']]
${QUALITY_BUTTON}      xpath=//div[@role='menuitem'][.//div[text()='Quality']]
*** Keywords ***
Change Video Quality
    [Arguments]    ${quality}
    Wait Until Element Is Visible    css=video    10s
    Handle Ads If Present
    Mouse Over    ${VIDEO}

    Wait Until Element Is Visible    ${SETTING_BUTTON}    10s
    Click Element    ${SETTING_BUTTON}

    Wait Until Element Is Visible    ${SETTING_MENU}    10s

    Click Element    ${QUALITY_BUTTON}

    Wait Until Element Is Visible    xpath=//span[contains(text(),'${quality}')]    10s
    Click Element    xpath=//span[contains(text(),'${quality}')]

Handle Ads If Present
    ${status}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${SKIP_BUTTON}    5s
    IF    ${status}
        Click Element    ${SKIP_BUTTON}
    END