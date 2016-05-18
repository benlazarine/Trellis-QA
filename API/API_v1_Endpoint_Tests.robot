*** Settings ***
Library           OperatingSystem
Resource          ../Trellis_Vars.robot

*** Test Cases ***
Search by Username
    [Tags]    functional
    ${SearchValue} =    Set Variable    ${User1UserName}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/username/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "email": "${User1EMail}"
    Should Contain    ${output}    "firstname": "${User1First}"
    Should Contain    ${output}    "lastname": "${User1Last}"

Search by email
    [Tags]    functional
    ${SearchValue} =    Set Variable    ${User1EMail}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/email/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "email": "${User1EMail}"
    Should Contain    ${output}    "firstname": "${User1First}"
    Should Contain    ${output}    "lastname": "${User1Last}"

Search by Name - Single
    [Tags]    functional
    ${SearchValue} =    Set Variable    ${User1Last}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/name/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "email": "${User1EMail}"
    Should Contain    ${output}    "firstname": "${User1First}"
    Should Contain    ${output}    "lastname": "${User1Last}"
    Should Contain    ${output}    "email": "${User2EMail}"
    Should Contain    ${output}    "firstname": "${User2First}"

Search by Name - Multipart Plus Sign
    [Tags]    functional
    ${SearchValue} =    Set Variable    ${User1First}+${User1Last}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} 'https://${WebHost}/api/v1/users/name/${SearchValue}' | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    ${LineCount} =    Run    echo '${output}' | wc -l
    Log    ${LineCount}
    Run Keyword If    ${LineCount} > 23    Fail    Got back too many matches
    Should Not Contain    ${output}    "email": "${User3EMail}"
    Should Not Contain    ${output}    "email": "${User4EMail}"

Search by Name - Multipart Space URL Encoded
    [Tags]    functional
    ${SearchValue} =    Set Variable    ${User1First}%20${User1Last}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} 'https://${WebHost}/api/v1/users/name/${SearchValue}' | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    ${LineCount} =    Run    echo '${output}' | wc -l
    Log    ${LineCount}
    Run Keyword If    ${LineCount} > 23    Fail    Got back too many matches
    Should Not Contain    ${output}    "email": "${User3EMail}"
    Should Not Contain    ${output}    "email": "${User4EMail}"

Search by Name - Multipart Actual Space
    [Tags]    functional    skipped
    ${SearchValue} =    Set Variable    ${User1First} ${User1Last}
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} 'https://${WebHost}/api/v1/users/name/${SearchValue}' | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    ${LineCount} =    Run    echo '${output}' | wc -l
    Log    ${LineCount}
    Run Keyword If    ${LineCount} > 23    Fail    Got back too many matches
    Should Not Contain    ${output}    "email": "${User3EMail}"
    Should Not Contain    ${output}    "email": "${User4EMail}"

Search by email - 2 char
    [Tags]    functional
    ${SearchValue} =    Set Variable    rb
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/email/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error": {
    Should Contain    ${output}    "Validation": "Search terms must have at least 3 characters"

Search by Username - 2 char
    [Tags]    functional
    ${SearchValue} =    Set Variable    rb
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/username/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error": {
    Should Contain    ${output}    "Validation": "Search terms must have at least 3 characters"

Search by Name - 2 char
    [Tags]    functional
    ${SearchValue} =    Set Variable    rb
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/name/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error": {
    Should Contain    ${output}    "Validation": "Search terms must have at least 3 characters"

Add a Service - First
    [Documentation]    Currently a service can only be added once. \ Will have to get something to clear services for a specific user and then we can add more in. \ Until then, this is tagged to be skipped.
    [Tags]    functional    USERMAN-100
    ${ServiceName} =    Set Variable    coge
    ${output} =    Run    curl -s -X POST -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/service/${ServiceName}/add/${UserName} | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "service":
    Should Contain    ${output}    ["Request to add ${ServiceName} to ${UserName}'s account was successful."]

Add a Service - Multiple
    [Tags]    functional
    ${ServiceName} =    Set Variable    coge
    ${output} =    Run    curl -s -X POST -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/service/${ServiceName}/add/${UserName} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error": {
    Should Contain    ${output}    "LogicException": "\\r\\n
    Should Contain    ${output}    User ipctest already has requested coge.\\r\\n
    Should Contain    ${output}    Multiple requests not permitted for the same service.\\r\\n

Method Not Supported
    [Documentation]    The response is supposed to be in JSON format as below but currently is not working that way.
    ...
    ...    Invalid HTTP method: Method not supported
    ...    {"error: {"HTTP": "Method not supported; only GET requests are accepted"}}
    [Tags]    functional
    ${MethodName} =    Set Variable    FooBar
    ${SearchValue} =    Set Variable    rbovill
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/${MethodName}/username/${SearchValue}
    Log    ${output}
    Should Contain    ${output}    We are sorry, but something went terribly wrong: No route found for "GET /api/v1/FooBar/username/rbovill"

Authentication Error
    [Tags]    functional
    ${PubKey} =    Set Variable    9999999999
    ${SearchValue} =    Set Variable    rbovill
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/username/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error":
    Should Contain    ${output}    "Auth": "Invalid API Key"

Invalid Secret Error
    [Tags]    functional
    ${PrivKey} =    Set Variable    9999999999
    ${SearchValue} =    Set Variable    rbovill
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/username/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error":
    Should Contain    ${output}    "Auth": "Invalid API Secret"

Unrecognized API Client
    [Documentation]    This test isn't complete yet. \ Need to use valid keys for different IP addresses, but not the one for the machine it is running on.
    [Tags]    functional    skipped
    ${PubKey} =    Set Variable    9999999999
    ${PubKey} =    Set Variable    9999999999
    ${SearchValue} =    Set Variable    rbovill
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v1/users/username/${SearchValue} | python -mjson.tool
    Log    ${output}
    Should Contain    ${output}    "error":
    Should Contain    ${output}    "Auth": "Unrecognized API Client"
