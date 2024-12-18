*** Settings ***
Library    RequestsLibrary    

*** Variables ***

*** Test Cases***

Realizing frist DELETE in Server Rest
    Create Session    alias=server_rest    url=https://serverest.dev

    ${RESPONSE}     DELETE On Session    alias=server_rest    url=/usuarios/ID   expected_status=200
    
    Log To Console        ${RESPONSE.text}    


*** Keywords ***

 