*** Settings ***
Library    RequestsLibrary    

*** Variables ***

*** Test Cases***

Realizing frist POST in Server Rest
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${HEADER}    Create Dictionary    Content-Type=application/json

    ${RESPONSE}     POST On Session    alias=server_rest    url=/usuarios    expected_status=201    headers=${HEADER}     data={ "nome": "Fulano da Silva", "email": "beltrano@1.com.br", "password": "teste", "administrador": "true"}

    ${MSG}    Set Variable     ${RESPONSE.json()['message']} 
    Log To Console     ${RESPONSE.json()}
    Should Be Equal    ${MSG}    Cadastro realizado com sucesso   

  

*** Keywords ***

 