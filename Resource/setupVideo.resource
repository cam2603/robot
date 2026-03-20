*** Settings ***
Resource    Common.resource
Library    SeleniumLibrary
*** Variables ***
${SETTING_BUTTON}       css=button.ytp-button.ytp-settings-button
${SETTING_MENU}      css=.ytp-settings-menu
${SKIP_BUTTON}      css=.ytp-ad-skip-button
${VIDEO}      css=video
${QUALITY_BUTTON}      xpath=//div[@role='menuitem'][.//div[text()='Quality']]
${QUALITY_BUTTON}      xpath=//div[@role='menuitem'][.//div[text()='Quality']]
${SPEED_BUTTON}      xpath=//div[@role='menuitem'][.//div[text()='Playback speed']]

${SUBSCRIBE_BUTTON}    css:#subscribe-button-shape button

${LOGIN_POPUP}         css:tp-yt-iron-dropdown
${LOGIN_TITLE}         css:tp-yt-iron-dropdown #title
${SIGNIN_BUTTON}       css:tp-yt-iron-dropdown a[aria-label="Sign in"]
*** Keywords ***

Open Setting Dialog
    Wait Until Element Is Visible    css=video    10s
    Handle Ads If Present
    Mouse Over    ${VIDEO}

    Wait Until Element Is Visible    ${SETTING_BUTTON}    10s
    Click Element    ${SETTING_BUTTON}

    Wait Until Element Is Visible    ${SETTING_MENU}    10s



Change Video Quality
    [Arguments]    ${quality}
    Open Setting Dialog
    Click Element    ${QUALITY_BUTTON}
    Wait Until Element Is Visible    xpath=//span[contains(text(),'${quality}')]    10s
    Click Element    xpath=//span[contains(text(),'${quality}')]


Handle Ads If Present
    ${status}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${SKIP_BUTTON}    5s
    IF    ${status}
        Click Element    ${SKIP_BUTTON}
    END


Test Subscribe Flow


    Wait Until Element Is Visible    ${SUBSCRIBE_BUTTON}   10s
    Click Element    ${SUBSCRIBE_BUTTON}

    ${is_login_popup}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${LOGIN_POPUP}    5s

    IF    ${is_login_popup}
        Log    User chưa đăng nhập → hiển thị popup

        Set Login Subcrible

    ELSE
        Log    User đã đăng nhập → subscribe thành công

        Element Should Contain    ${SUBSCRIBE_BUTTON}    Subscribed
    END


Set Login Subcrible
        Element Should Be Visible    ${LOGIN_TITLE}
        Element Should Contain       ${LOGIN_TITLE}    Want to subscribe

        Element Should Be Visible    ${SIGNIN_BUTTON}
        Click Element                ${SIGNIN_BUTTON}
