*** Settings ***
Documentation        Neste arquivo estarão presentes todos os exercícios de automação do curso prime hero

*** Variables ***
# Minha primeira variável do tipo dicionário    
&{PESSOA}            
...    nome=Helder    
...    sobrenome=Fernandes    
...    idade=28 anos    
...    cpf=12345678911    
...    profissão=analista de testes    
...    carro=Sentra

@{FRUTAS}    Banana    Abacaxi    Limão    Jabuticaba

  

*** Test Cases ***
Cenario: Imprimindo 6 informações de uma pessoa
    Log To Console        ${PESSOA.sobrenome}
    Log To Console        ${PESSOA.idade}
    Log To Console        ${PESSOA.cpf}
    Log To Console        ${PESSOA.profissão}
    Log To Console        ${PESSOA.carro}

Cenario: Imprimindo uma lista de frutas 
    [Tags]            LISTA
    Log To Console    ${FRUTAS}
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[3]}

Cenario: Somando dois números
    [Tags]                Somar
    Somar dois números    10    10


Cenario: Contando de 0 a 9
    [Tags]                    CONTAR
    FOR    $(COUNT)    IN RANGE    0    9
            Log        $(COUNT)
    END

Cenario: PercorreR Lista de frutas
    [Tags]            PercorreR
    Percorrer itens de uma lista


Cenario: Tomando decisões
    [Tags]            IF
    Tomar decisões

*** Keywords ***
Somar dois números
    [Arguments]    ${NUM_A}        ${NUM_B}
    ${SOMA}        Evaluate        ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}    
 

Contar de 0 a 9
    FOR    $(COUNT)    IN RANGE    0    9
        Log    $(COUNT)
    END


Percorrer itens de uma lista
    @{FRUTAS}    Create List    Banana    Abacaxi    Limão
    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log To Console    ${FRUTA}
        END


Tomar decisões
    FOR    ${COUNT}    IN RANGE    0    9
        IF    '${COUNT}' == '5'
            Log To Console    Estou no numero ${COUNT}
        ELSE IF    '${COUNT}' == '8'
            Log To Console    Estou no numero ${COUNT}
        ELSE
            Log To Console    Este não é o número 5 ou o número 8    
        END
    END


