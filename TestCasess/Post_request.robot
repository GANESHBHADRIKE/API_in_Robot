*** Settings ***

Library     RequestsLibrary
Library    requests
Library     Collections
*** Variables ***
${base_url}         https://reqres.in

*** Test Cases ***
Put_coustomer
    Create Session    mysession   ${base_url}
    ${body}=    Create Dictionary        id=13    email=ganesh@gmail.com         first_name=Bhadrike      last_name=bhadrike@gmail.com    avatar=https://reqres.in/img/faces/7-image.jpg
    ${header}=     Create Dictionary       Content-Type=application/json 
    ${response}=     POST On Session      mysession      url=/api/users?page=2    data=${body}    headers=${header}
    Log To Console    ${response.status_code}