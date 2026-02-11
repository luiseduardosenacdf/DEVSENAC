Algoritmo "soma vetor"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    numeros: vetor[1 .. 8] de inteiro
    i, soma: inteiro
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    soma <- 0
    para i de 1 ate 8 faca
    escreva("Digite o ", i, "º número: ")
    leia(numeros [i])
    soma <- soma + numeros [i]
    fimpara
    escreval("A soma dos números é: ", soma)
Fimalgoritmo

