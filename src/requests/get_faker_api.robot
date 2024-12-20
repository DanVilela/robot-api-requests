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

Realizing second GET in Faker API using control expected_status
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1  expected_status=200
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.text} 


Realizing third GET in Faker API using IF and ELSE
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
       ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=2
    
    Log To Console     ${RESPONSE} 
    Log To Console     ${RESPONSE.json()['data'][0]['country']} 

    ${country}    Set Variable    ${RESPONSE.json()['data'][0]['country']} 

    IF    '${country}' == 'Japan'
        Log To Console    This is my country
    ELSE
        Log To Console    Is this another country - ${country}
    END
    
    Should Not Be Equal    ${country}    Japan

    Delete All Sessions
Realizing fourth GET in Faker API using FOR
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/
    
    FOR    ${i}    IN RANGE    10

        ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=2
         
        Log To Console     ${RESPONSE.json()['data'][0]['country']} 
        ${var}    Set Variable    ${RESPONSE.json()['data'][0]['country']} 
        
        Exit For Loop if    '${var}'=='Japan'

        Sleep    2s
            
    END

    Delete All Sessions



*** Keywords ***

 