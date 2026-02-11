Algoritmo "media_notas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    notas: vetor[1 .. 5] de real
    i: inteiro
    soma, media: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    soma <- 0
    para i de 1 ate 5 faca
    escreva("Digite a ", i, "ª nota: ")
    leia(notas[i])
    soma <- soma + notas [i]
    fimpara
    media <- soma / 5
    escreval("A media das notas e: ", media)

Fimalgoritmo
