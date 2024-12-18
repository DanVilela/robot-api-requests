*** Settings ***
Library    RequestsLibrary    

*** Variables ***

*** Test Cases***

Realizing frist PUT in Server Rest
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${HEADER}    Create Dictionary    Content-Type=application/json

    ${RESPONSE}     POST On Session    alias=server_rest    url=/usuarios/aSo0RJCmRIj1yKyk    expected_status=200    headers=${HEADER}     data={ "nome": "Fulano da Silva11", "email": "beltrano@qA20.com.br", "password": "teste", "administrador": "true"}

    ${MSG}    Set Variable     ${RESPONSE.json()['message']} 

    Should Be Equal    ${MSG}    Cadastro realizado com sucesso   


*** Keywords ***

 