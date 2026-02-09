Algoritmo "maior_menor_valor"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    numeros: vetor[1..5] de inteiro
    i, maior, menor: inteiro
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    para i de 1 ate 5 faca
    escreva("Digite o ", i, "º número: ")
    leia(numeros[i])
    fimpara
    maior <- numeros[1]
    menor <- numeros[1]
    para i de 2 ate 5 faca
    se numeros [i] > maior entao
    maior <- numeros[i]
    fimse
    se numeros [i] < menor entao
    menor <- numeros [i]
    fimse
    fimpara
    escreval("Maior valor: ", maior)
    escreval("Menor valor: ", menor)
Fimalgoritmo