*** Settings ***
Documentation     This test verifies the default landing page, the associated links, Login screen and the information on the page.
Suite Teardown    Close All Browsers
Test Timeout      1 minute
Force Tags        skipped
Library           Selenium2Library    5s    run_on_failure=Trellis Run On Failure
Resource          ../Trellis_Vars.robot
Resource          ../Trellis_GUI.robot

*** Test Cases ***
Open Home Page
    [Tags]    GUI    smoke
    Comment    Set the default selenium timeout
    Set Selenium Timeout    60s
    Comment    Open Browser and go to site
    Open Browser    http://${WebHost}/    ${Browser}    ${BrowserAlias}
    Comment    Open the browser fullscreen.
    Maximize Browser Window
    Comment    Wait until we see the default landing page
    Wait Until Page Contains Element    link=Login    ${GUIWaitLong}

Verify InCommon Login button - disabled
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#login>a.button.disabled

Verify InCommon Link text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    InCommon

Verify InCommon description text - Part 1
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Coming Soon

Verify InCommon description text - Part 2
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Log in with the same username and password used at your institution using

Verify InCommon description text - Part 3
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    . InCommon federates user credentials across many academic and research institutions in the United States.

Open InCommon Link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Link     InCommon
    Select Window    title=InCommon: Security, Privacy and Trust for the Research and Education Community
    Wait Until Page Contains    Join InCommon    ${GUIWaitShort}
    Location Should Be    http://www.incommonfederation.org/
