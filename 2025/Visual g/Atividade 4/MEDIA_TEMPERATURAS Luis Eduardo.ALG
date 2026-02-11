Algoritmo "media_temperaturas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    temp: vetor[1 .. 7] de real
    i: inteiro
    soma, media: real
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    soma <- 0
    para i de 1 ate 7 faca
    escreva("Digite a temperatura do dia ", i, ": ")
    leia(temp[i])
    soma <- soma + temp[i]
    fimpara
    media <- soma / 7
    escreval("A media da semana foi: ", media)
Fimalgoritmo

