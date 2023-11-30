*** Settings ***
Library        RequestsLibrary
Library    SeleniumLibrary
Library    os
Library     json
Library     JSONLibrary
Library    String


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


    
#validating content of  json file store in local drive
    ${json_data}=      Load Json From File     C:/Users/Ganesh Bhadrike/API_Testing/file/data.json
     
    ${value_from_path}=   Get Value From Json     ${json_data}     $.location.name 
    Log To Console    value is: ${value_from_path} 
    ${value_from_path}=   Convert To String       ${value_from_path} 
    ${value_from_path}    Remove String Using Regexp    ${value_from_path}    [''\\[\\],]
    Log To Console    value is: ${value_from_path} 
     
    Should Be Equal      ${value_from_path}    London
    
