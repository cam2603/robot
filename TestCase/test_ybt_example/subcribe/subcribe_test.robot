
*** Settings ***
Resource    ../../../Resource/Common.resource
Suite Setup       Test-precondition
Suite Teardown    Test-postCondition

*** Variables ***
${keyword}    baby shark

*** Test Cases ***
Test Subscribe Flow
    Open Web
    TestSearhAndOpenVideo    Baby Shark
    Test Subscribe Flow