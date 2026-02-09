Algoritmo "vetor_nomes"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    nomes: vetor[1 .. 5] de caractere
    i: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    para i de 1 ate 5 faca
    escreva("Digite o ", i, "º nome: ")
    leia(nomes[i])
    fimpara
    escreval("Os nomes digitados foram:")
    para i de 1 ate 5 faca
    escreval(nomes [i])
    fimpara

Fimalgoritmo