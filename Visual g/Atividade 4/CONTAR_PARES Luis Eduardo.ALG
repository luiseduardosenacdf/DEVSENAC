Algoritmo "contar_pares"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 19/05/2025
Var
// Seção de Declarações das variáveis 
    numeros: vetor[1..10] de inteiro
    i, qtdPares: inteiro
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
    qtdPares <- 0
    para i de 1 ate 10 faca
    escreva("Digite o ", i, "º número: ")
    leia(numeros[i])
    se numeros[i] mod 2 = 0 entao
    qtdPares <- qtdPares + 1
    fimse
    fimpara
    escreval("Quantidade de números pares: ", qtdPares)
Fimalgoritmo