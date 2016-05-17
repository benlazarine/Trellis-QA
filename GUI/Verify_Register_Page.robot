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

Click Register button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    xpath=//a[text()="Register"]
    Wait Until Page Contains    Personal Information    ${GUIWaitShort}
    Location Should Be    https://user.cyverse.org/register/

Verify Register Info Text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    After you complete the registration process, you will have automatic access to the following CyVerse services:
    Page Should Contain    Discovery Environment, My-Plant, CyVerse Data Store, CyVerse Wiki, TNRS and Bug and Issue Tracking.

Verify Personal Information fieldset
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#new_user>fieldset:nth-child(2)

Verify Personal Information label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#new_user>fieldset:nth-child(2)>legend    Personal Information

Verify First Name header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    First Name *

Verify First Name field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_firstname

Verify First Name field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#names>div:nth-child(1)>span.required

Verify Last Name header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Last Name *

Verify Last Name field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_lastname

Verify Last Name field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#names>div:nth-child(1)>span.required

Verify Gender header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Gender

Verify Male label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Male

Verify Male radio button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_gender_male[type=radio]

Verify Female label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Female

Verify Female radio button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_gender_female[type=radio]

Verify Decline to Answer label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Decline to Answer

Verify Decline to Answer radio button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_gender_declined[type=radio]

Verify Ethnicity header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Ethnicity (optional)

Verify Ethnicity field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_ethnicity]

Verify Ethnicity dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_ethnicity

Verify Ethnicity dropdown options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    css=select#person_ethnicity
    Page Should Contain    African American or Black, not of Hispanic Origin
    Page Should Contain    American Indian, Alaskan Native, Hawaiian Native
    Page Should Contain    Asian or Pacific Islander
    Page Should Contain    White, Hispanic or Latino
    Page Should Contain    White, including Arabic, not of Hispanic Origin
    Page Should Contain    Other
    Page Should Contain    Decline to Provide

Verify Citizenship header
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Citizenship *

Verify Citizenship field required
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label.required[for=person_citizenship]+span.required

Verify Citizenship dropdown
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_citizenship

Verify Citizenship dropdown options
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Click Element    css=select#person_citizenship
    Comment   Verify a small sample, as the whole list is 250+ items long.
    Page Should Contain Element    css=#person_citizenship>option[value=CN]
    Page Should Contain Element    css=#person_citizenship>option[value=IN]
    Page Should Contain Element    css=#person_citizenship>option[value=GB]
    Page Should Contain Element    css=#person_citizenship>option[value=US]

Verify City header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    City *

Verify City field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_address_city

Verify City field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_address_city]+span.required

Verify State/Province header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    State/Province *

Verify State/Province field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_address_state

Verify State/Province field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_address_state]+span.required

Verify Country header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Country *

Verify Country dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_address_country

Verify Country dropdown required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_address_country]+span.required

Verify Country dropdown options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Click Element    css=select#person_citizenship
    Click Element    css=select#person_address_country
    Comment   Verify a small sample, as the whole list is 250+ items long.
    Page Should Contain Element    css=#person_address_country>option[value=CN]
    Page Should Contain Element    css=#person_address_country>option[value=IN]
    Page Should Contain Element    css=#person_address_country>option[value=GB]
    Page Should Contain Element    css=#person_address_country>option[value=US]

Verify Contact fieldset
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#contact

Verify Email header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Email *

Verify Email field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_emails_0_email

Verify Email field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_emails_0_email]+span.required

Verify Phone header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Phone (optional)

Verify Phone field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_phonenumbers_0_number

Verify Fax header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Fax (optional)

Verify Fax field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_faxnumbers_0_number

Verify Research Study header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Participate in a research study about your use of CyVerse's applications and services?

Verify Understanding Use link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=a[href="http://www.iplantcollaborative.org/about/understanding-use"]
    Page Should Contain Link   Understanding Use

Open Understanding Use link
    [Tags]    GUI    smoke    USERMAN-123
    Switch Browser    ${BrowserAlias}
    Click Link    Understanding Use
    Select Window    title=Understanding Use | iPlant Collaborative Web Portal
    Location Should Be    http://www.iplantcollaborative.org/about/understanding-use
    Comment    Return to the Register page for the remainder of the test suite.
    Select Window    title=New Registration | iPlant Collaborative | Tucson, AZ
    Location Should Be    https://user.iplantcollaborative.org/register/

Verify Yes label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Yes

Verify Yes radio button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_profile_participate_in_survey_1[type=radio]

Verify Yes Selected by Default
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_profile_participate_in_survey_1[checked=checked]

Verify No label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    No

Verify No radio button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Radio Button    css=#person_gender_female[type=radio]

Verify Heard About label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    How did you hear about us?

Verify Heard About dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_profile_how_heard_about

Verify Heard About options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    css=select#person_profile_how_heard_about
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=""]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=friend]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=student]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=instructor]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=colleague]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=workshop]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=convention]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value="direct email"]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value="search engine"]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=internet]
    Page Should Contain Element    css=#person_profile_how_heard_about>option[value=other]

Verify Institution fieldset
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#institution

Verify Institution fieldset label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#institution    Institutional Information

Verify Company or Institution header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Company or Institution *

Verify Company or Institution field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_profile_institution_name

Verify Company or Institution field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_profile_institution_name]+span.required

Verify Your Department header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Your Department *

Verify Your Department field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_profile_department

Verify Your Department field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_profile_department]+span.required

Verify Your Occupation label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Your Occupation

Verify Your Occuption dropdown required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_profile_position]+span.required

Verify Your Occupation dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_profile_position

Verify Your Occupation options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    css=select#person_profile_position
    Page Should Contain    K-12 Student
    Page Should Contain    K-12 Teacher
    Page Should Contain    Undergraduate Student
    Page Should Contain    Graduate Student
    Page Should Contain    Postdoctorate
    Page Should Contain    University/College Faculty
    Page Should Contain    University/College Staff
    Page Should Contain    Industrial User
    Page Should Contain    Government User
    Page Should Contain    Unaffiliated User
    Page Should Contain    Nonprofit User
    Page Should Contain    Other

Verify Your Research Area label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Your Research Area (optional)

Verify Your Research Area dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_profile_research_area

Verify Your Research Area options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    css=select#person_profile_research_area
    Page Should Contain    Advanced Scientific Computing
    Page Should Contain    Bioinformatics
    Page Should Contain    Geophysics
    Page Should Contain    Science and Engineering Education
    Page Should Contain    Plant Biology
    Page Should Contain    Marine Geology and Geophysics
    Page Should Contain    Volcanology and Mantle Geochemistry

Verify Funding Agencies label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Funding Agencies (optional)

Verify Funding Agencies list
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=select#person_profile_institution_funding_agencies

Verify Funding Agencies list options
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    National Science Foundation (NSF)
    Page Should Contain    ACS Petroleum Research Fund
    Page Should Contain    Dept of Agriculture (USDA)
    Page Should Contain    Dept of Commerce (includes NOAA)
    Page Should Contain    Dept of Defense (DoD, DARPA, and labs)
    Page Should Contain    Dept of Education
    Page Should Contain    Dept of Energy (DoE and labs)
    Page Should Contain    Dept of Interior
    Page Should Contain    Dept of Transportation (US)
    Page Should Contain    Environmental Protection Agency (EPA)
    Page Should Contain    Foundation
    Page Should Contain    Industry
    Page Should Contain    International
    Page Should Contain    NASA (and centers)
    Page Should Contain    National Institutes of Health (any institute)
    Page Should Contain    Smithsonian Institution
    Page Should Contain    State (any state agency)
    Page Should Contain    University
    Page Should Contain    Other
    Page Should Contain    Not Applicable

Verify Account Login fieldset
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#account

Verify Account Login fieldset label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#account    Account Login

Verify Username header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Username *

Verify Username field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_account_username

Verify Username field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_account_username]+span.required

Verify Password header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Password *

Verify Password field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_account_password_password

Verify Password field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_account_password_password]+span.required

Verify Password Strength meter
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=#person_account_password_password_simplePassMeter

Verify Confirm Password header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Confirm password *

Verify Confirm Password field
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input#person_account_password_confirm_password

Verify Confirm Password field required
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=label[for=person_account_password_confirm_password]+span.required

Verify Username Restrictions
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#account>div>p.info    Username must have at least 3 characters. Lowercase only. First character must be a lowercase letter. May only contain lowercase letters, numbers, dashes and underscores (_).

Verify Password Restrictions
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#account>div>p.help-block    Pasted passwords may not work.
    Element Should Contain    css=#account>div>p+p.help-block    Optional special characters may only be: !, @, \#, $, %, ^, &, *, ?, _, ~

Verify Recaptcha header
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Element Should Contain    css=#person_id+div>label    Recaptcha

Verify Recaptcha box
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    css=#recaptcha_widget_div
    Page Should Contain Element    css=#recaptcha-checkbox-checkmark

Verify Save Button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=input[value=Save]
