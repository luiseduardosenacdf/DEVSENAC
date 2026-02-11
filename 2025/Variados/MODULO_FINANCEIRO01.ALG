Algoritmo "Modulo_Financeiro"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 20/05/2025

Var
   // Seção de Declarações das variáveis

   // Controle Geral
   opcaoMenu, opcaoPagamento, opcaoControle, opcaoRelatorio, i: inteiro

   // Pagamentos
   nomeCompra:  vetor[1..10] de caractere
   valorCompra: vetor[1..10] de real
   totalCompra: inteiro

Inicio
   // Seção de Comandos, procedimentos, funções, operadores, etc...

   // Menu Principal
   repita
      escreval("=========== Menu Principal ===========")
      escreval("1- Área de Pagamento")
      escreval("2- Controle de Caixa")
      escreval("3- Relatórios Financeiro")
      escreval("0- Sair")
      escreval("======================================")
      escreva("Escolha sua opção: ")
      leia(opcaoMenu)

      // Área de pagamento
      se opcaoMenu = 1 entao
         repita
            escreval("========= Menu de Pagamento =========")
            escreval("1 - Registrar Compras")
            escreval("2 - Listar Compras")
            escreval("3 - Registrar Pagamentos")
            escreval("4 - Listar Pagamentos")
            escreval("5 - Saldo")
            escreval("0 - Voltar ao Menu")
            escreval("=====================================")
            escreva("Escolha sua opção: ")
            leia(opcaoPagamento)

            // Processamento da area de pagamento
            se opcaoPagamento = 1 entao
             // Registro de pagamentos
             se totalCompra < 10 entao
             totalCompra:= totalCompra + 1
             escreval("Digite o nome da sua compra ")
            fimse
         ate opcaoPagamento = 0
      fimse

      // Controle de Caixa
      se opcaoMenu = 2 entao
         repita
            escreval("======= Menu de controle de caixa =======")
            escreval("1 - ")
            escreval("2 - ")
            escreval("3 - ")
            escreval("4 - ")
            escreval("5 - ")
            escreval("0 - Voltar ao Menu")
            escreval("=========================================")
            escreva("Escolha sua opção: ")
            leia(opcaoControle)

            // Processamento da area de pagamento
         ate opcaoControle = 0
      fimse

      // Controle de Relatorios Financeiros
      se opcaoMenu = 3 entao
         repita
            escreval("======= Menu de Relatorio Financeiro =======")
            escreval("1 - ")
            escreval("2 - ")
            escreval("3 - ")
            escreval("4 - ")
            escreval("5 - ")
            escreval("0 - Voltar ao Menu")
            escreval("============================================")
            escreva("Escolha sua opção: ")
            leia(opcaoRelatorio)

            // Processamento da area de pagamento
         ate opcaoRelatorio = 0
      fimse
   ate opcaoMenu = 0



Fimalgoritmo
