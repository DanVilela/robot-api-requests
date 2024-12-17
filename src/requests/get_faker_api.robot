*** Settings ***
Library    RequestsLibrary    

*** Variables ***

*** Test Cases***

Realizing frist GET in Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=1
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.text} 

    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1

    ${return}    Session Exists    alias=faker_api
    Log To Console    ${return}
    
    Delete All Sessions

    ${return}    Session Exists    alias=faker_api
    Log To Console    ${return}

Realizing second GET in Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1  expected_status=200
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.text} 


Realizing third GET in Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=images?_quantity=2&_type=any&_height=300
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.text} 


Realizing fourth GET in Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=1
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.text} 
    



*** Keywords ***

