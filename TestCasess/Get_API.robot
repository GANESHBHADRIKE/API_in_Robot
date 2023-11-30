*** Settings ***
Library        RequestsLibrary
Library    SeleniumLibrary
Library    os
Library     json
Library     JSONLibrary


*** Variables ***
${base_url}     http://api.weatherapi.com/   
${city}      London 
${current_url}        v1/current.json?key=cfb9aa99fb25495a9ed43258233011&q=     


*** Test Cases ***

Get_Wetherinfo
    create Session        myssion        ${base_url}
    ${responce}=       GET On Session        myssion       url=v1/current.json?key=cfb9aa99fb25495a9ed43258233011&q=London            
    Log To Console    Header: ${responce.headers}
    Log To Console    Status: ${responce.status_code}
    Log To Console    content: ${responce.content}
    
#validation
    ${Status_code}        Convert To String    ${responce.status_code}
    Log To Console    ${Status_code}
    Should Be Equal      ${Status_code}  200


