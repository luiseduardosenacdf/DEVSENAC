Algoritmo "Media_Notas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 08/05/2025
Var
// Seção de Declarações das variáveis 
     nota, soma, contador: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
     soma <- 0
     contador <- 0
     escreval("Digite uma nota(negativa para encerrar): ")
     leia(nota)
     enquanto nota >= 0 faca
     soma <- soma + nota
     contador <- contador +1
     escreval("Digite outra nota (negativa para sair): ")
     leia(nota)
     fimenquanto
     se contador > 0 entao
     escreval("Média das notas: ", soma / contador)
     senao
     escreval("Nenhuma nota válida foi digitada.")
     fimse

Fimalgoritmo