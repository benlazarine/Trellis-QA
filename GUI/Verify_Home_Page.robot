*** Settings ***
Documentation     This test verifies the default landing page, the associated links, Login screen and the information on the page.
Suite Teardown    Close All Browsers
Test Timeout      1 minute
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

Verify Logo link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    The following is the link attached to the logo image I believe
    Page Should Contain Element    css=#logo-wrapper
    Comment    The following is the logo image I believe
    Page Should Contain Element    css=#logo

Verify Login link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Login

Verify Trellis link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    link=Trellis: CyVerse User Management

Verify Banner text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    A centralized place for you to manage your CyVerse user profile and services.

Verify New User link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=New User?

Verify New User Register button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    The following xpath is for the "Register" button
    Page Should Contain Element    xpath=//a[text()="Register"]

Verify Click to manage text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Click to manage your CyVerse user profile information and the CyVerse services that are available to you.

Verify Forgot your Password text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Forgot your Password?

Verify Reset Password button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    The following xpath is for the "Reset Password" button
    Page Should Contain Element    xpath=//a[text()="Reset Password"]

Verify Reset your password text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Click here to reset your password.

Verify Version/Copyright text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Trellis 1.1.2; © Copyright 2016 by CyVerse

Verify Contact link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Help

Open Contact link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    link=Help

Verify Help Request text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Help Request

Verify Help Tell us text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Tell us how we can help you.

Verify Email label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Email

Verify Email editbox
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#contact_email

Verify Body label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Body

Verify Body editbox
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#contact_body

Verify Send Mail button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#contact__token
