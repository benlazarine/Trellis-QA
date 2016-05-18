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

Click Reset Password button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Click Element    css=#register+div>a
    Click Link    Reset Password
    Wait Until Page Contains    Request to Reset Password    ${GUIWaitShort}

Verify Request header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#text>div>h2    Request to Reset Password

Verify Reminder text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#text>div>p    Enter either your CyVerse username or the email address you registered with to receive an email with a link to reset your password.

Verify Username header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=label[for=form_username]    CyVerse Username

Verify Username field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#form_username

Verify Email Address header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=label[for=form_email]    Email Address

Verify Email Address field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#form_email

Verify Email Address reminder text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    This is the email you used to register with CyVerse

Verify Recaptcha header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#form__token+div>label    Recaptcha

Verify Recaptcha box
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#recaptcha_widget_div

Verify Send Link Button
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input[value="Send Link"]

Verify Contact tab
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#contact-slide-out>a

Slide Out Contact tab
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    css=#contact-slide-out>a
    Wait Until Page Contains Element    css=#contact-slide-out.open    ${GUIWaitShort}

Verify Help Request header
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Element Should Contain    css=#contact-slide-out>h3    Help Request
    Element Should Contain    css=#contact-slide-out>h3    Request to Reset Password

Verify Help text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Tell us how we can help you.

Verify Contact Tab Email Address header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Email *

Verify Contact Tab Email Address field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#contact_email

Verify Contact Tab Email Address field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#contact_email[required=required]

Verify Contact Tab Body header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Body *

Verify Contact Tab Body field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=textarea#contact_body

Verify Contact Tab Body field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=textarea#contact_body[required=required]

Verify Send Mail Button
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#contact__token+input[value="Send Mail"]

Verify Forgotten Username
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Forgotten Username

Verify Forgotten Username help text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Have a reminder sent to your email address which you registered with CyVerse.

Verify Reminder link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    reminder sent

Verify Forgotten Email Address
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Forgotten Email Address

Verify Forgotten Email Address help text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Contact CyVerse Support:

Verify Contact Tab reminder
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Use the contact tab to the left

Verify Email reminder
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Email: support@cyverse.org

Verify Email link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    support@cyverse.org

Verify Web Form reminder
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Web Form: http://www.cyverse.org/support.

Verify Web Form link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/support

Open Web Form link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Link    http://www.cyverse.org/support
    Comment    Wait Until Page Contains    Submit an iPlant Core Services Support Request
    Comment    Location Should Be    http://www.cyverse.org/contact
    Wait Until Page Contains Element    link=Submit Feedback
    Location Should Be    http://www.cyverse.org/contact
