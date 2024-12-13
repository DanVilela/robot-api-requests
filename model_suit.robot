*** Settings ***
Library    RequestsLibrary    

*** Variables ***

*** Test Cases***

Realizing frist GET in Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=1
    
    # Log To Console     ${RESPONSE} 
    # Log To Console     ${RESPONSE.text} 

    # ${return}    Session Exists    alias=faker_api
    # Log To Console    ${return}
    
    Delete All Sessions

    ${return}    Session Exists    alias=faker_api
    # Log To Console    ${return}



*** Keywords ***


