Algoritmo "Sistema_Caixa_Financeiro_Casa_da_Sorte"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 27/05/2025

Var
   // Menus
   opcaoMenu, opcaoCaixa, opcaoPagamento, opcaoRelatorio: inteiro

   // Caixa
   entradasCaixa, saidasCaixa, saldoCaixa: real
   valorTemp, valorUnitario: real
   qtdBilhetes: inteiro
   tipoJogo, origemDeposito, nomeGanhador, jogoPremiado, tipoComissao, descricaoConta, nomeSaque, cpfSaque: caractere

   // Despesas da Lotérica
   tipoDespesaLoterica: vetor[1..10] de caractere
   nomeDespesaLoterica: vetor[1..10] de caractere
   valorDespesaLoterica: vetor[1..10] de real
   totalDespesasLoterica: inteiro

   // Funcionários
   nomeFuncionario: vetor[1..10] de caractere
   funcaoFuncionario: vetor[1..10] de caractere
   salarioFuncionario: vetor[1..10] de real
   totalFuncionarios: inteiro

   i: inteiro
   tecla: caractere

Procedimento AtualizarSaldo()
Inicio
   saldoCaixa <- entradasCaixa - saidasCaixa
FimProcedimento

Inicio
   // Inicialização
   entradasCaixa <- 0
   saidasCaixa <- 0
   totalDespesasLoterica <- 0
   totalFuncionarios <- 0
   AtualizarSaldo()

   repita
      limpatela
      escreval("=========== MENU PRINCIPAL ===========")
      escreval("1 - Caixa")
      escreval("2 - Pagamentos")
      escreval("3 - Relatórios")
      escreval("0 - Sair")
      escreval("======================================")
      escreva("Escolha uma opção: ")
      leia(opcaoMenu)

      // ----- MENU 1: CAIXA DETALHADO -----
      se opcaoMenu = 1 entao
         repita
            limpatela
            escreval("=========== MENU DO CAIXA ===========")
            escreval("1 - Venda de Jogos")
            escreval("2 - Depósito")
            escreval("3 - Premiação")
            escreval("4 - Comissão")
            escreval("5 - Conta a Pagar")
            escreval("6 - Saque")
            escreval("0 - Voltar")
            escreval("=====================================")
            escreva("Escolha uma opção: ")
            leia(opcaoCaixa)

            // 1.1.1 Venda de Jogos
            se opcaoCaixa = 1 entao
               limpatela
               escreva("Informe o tipo de jogo (ex: Mega-Sena, Lotofácil): ")
               leia(tipoJogo)
               escreva("Quantidade de bilhetes: ")
               leia(qtdBilhetes)
               escreva("Valor por bilhete: R$ ")
               leia(valorUnitario)
               valorTemp <- qtdBilhetes * valorUnitario
               entradasCaixa <- entradasCaixa + valorTemp
               escreval("Venda registrada: ", qtdBilhetes, "x ", tipoJogo, " = R$ ", valorTemp:2:2)
            fimse

            // 1.2.1 Depósito
            se opcaoCaixa = 2 entao
               limpatela
               escreva("Origem do depósito (ex: Banco, Cliente): ")
               leia(origemDeposito)
               escreva("Valor do depósito: R$ ")
               leia(valorTemp)
               entradasCaixa <- entradasCaixa + valorTemp
               escreval("Depósito de ", origemDeposito, " no valor de R$ ", valorTemp:2:2, " registrado.")
            fimse

            // 1.3.1 Premiação
            se opcaoCaixa = 3 entao
               limpatela
               escreva("Nome do ganhador: ")
               leia(nomeGanhador)
               escreva("Jogo premiado: ")
               leia(jogoPremiado)
               escreva("Valor da premiação: R$ ")
               leia(valorTemp)
               saidasCaixa <- saidasCaixa + valorTemp
               escreval("Premiação registrada: ", nomeGanhador, " ganhou R$ ", valorTemp:2:2, " em ", jogoPremiado)
            fimse

            // 1.4.1 Comissão
            se opcaoCaixa = 4 entao
               limpatela
               escreva("Tipo de comissão (venda, gerente, etc.): ")
               leia(tipoComissao)
               escreva("Valor da comissão: R$ ")
               leia(valorTemp)
               saidasCaixa <- saidasCaixa + valorTemp
               escreval("Comissão de R$ ", valorTemp:2:2, " registrada para: ", tipoComissao)
            fimse

            // 1.5.1 Conta a Pagar
            se opcaoCaixa = 5 entao
               limpatela
               escreva("Descrição da conta (ex: Energia, Internet): ")
               leia(descricaoConta)
               escreva("Valor da conta: R$ ")
               leia(valorTemp)
               saidasCaixa <- saidasCaixa + valorTemp
               escreval("Conta registrada: ", descricaoConta, " no valor de R$ ", valorTemp:2:2)
            fimse

            // 1.6.1 Saque
            se opcaoCaixa = 6 entao
               limpatela
               escreva("Nome de quem está sacando: ")
               leia(nomeSaque)
               escreva("CPF: ")
               leia(cpfSaque)
               escreva("Valor do saque: R$ ")
               leia(valorTemp)

               // Garantir que o valor do saque seja válido
               se valorTemp > 0 então
                  // Verifica se o valor do saque não ultrapassa o saldo disponível
                  se valorTemp <= saldoCaixa então
                     saidasCaixa <- saidasCaixa + valorTemp
                     saldoCaixa <- saldoCaixa - valorTemp  // Atualiza o saldo após o saque
                     escreval("Saque realizado para ", nomeSaque, " (CPF: ", cpfSaque, ") no valor de R$ ", valorTemp:2:2)
                  senao
                     escreval("Saldo insuficiente para o saque. Você tem R$ ", saldoCaixa:2:2, " disponível.")
                  fimse
               senao
                  escreval("Valor inválido para saque! O valor precisa ser maior que R$ 0,00.")
               fimse
            fimse


            AtualizarSaldo()
            escreval("Pressione ENTER para continuar...")
            leia(tecla)

         ate opcaoCaixa = 0
      fimse

      // ----- PAGAMENTOS -----
      se opcaoMenu = 2 entao
         repita
            limpatela
            escreval("=========== MENU DE PAGAMENTOS ===========")
            escreval("1 - Ver saldo atual do caixa")
            escreval("2 - Registrar despesa da lotérica")
            escreval("3 - Registrar salário de funcionário")
            escreval("0 - Voltar")
            escreval("==========================================")
            escreva("Escolha uma opção: ")
            leia(opcaoPagamento)

            se opcaoPagamento = 1 entao
               limpatela
               AtualizarSaldo()
               escreval("Saldo atual do caixa: R$ ", saldoCaixa:2:2)
            fimse

            se opcaoPagamento = 2 entao
               limpatela
               se totalDespesasLoterica < 10 entao
                  totalDespesasLoterica <- totalDespesasLoterica + 1
                  escreva("Tipo da despesa: ")
                  leia(tipoDespesaLoterica[totalDespesasLoterica])
                  escreva("Nome da despesa: ")
                  leia(nomeDespesaLoterica[totalDespesasLoterica])
                  escreva("Valor da despesa: R$ ")
                  leia(valorDespesaLoterica[totalDespesasLoterica])
                  saidasCaixa <- saidasCaixa + valorDespesaLoterica[totalDespesasLoterica]
               senao
                  escreval("Limite de despesas atingido.")
               fimse
            fimse

            se opcaoPagamento = 3 entao
               limpatela
               se totalFuncionarios < 10 entao
                  totalFuncionarios <- totalFuncionarios + 1
                  escreva("Nome do funcionário: ")
                  leia(nomeFuncionario[totalFuncionarios])
                  escreva("Função: ")
                  leia(funcaoFuncionario[totalFuncionarios])
                  escreva("Salário: R$ ")
                  leia(salarioFuncionario[totalFuncionarios])
                  saidasCaixa <- saidasCaixa + salarioFuncionario[totalFuncionarios]
               senao
                  escreval("Limite de funcionários atingido.")
               fimse
            fimse

            AtualizarSaldo()
            escreval("Pressione ENTER para continuar...")
            leia(tecla)

         ate opcaoPagamento = 0
      fimse

      // ----- RELATÓRIOS -----
      se opcaoMenu = 3 entao
         limpatela
         AtualizarSaldo()
         escreval("=========== RELATÓRIO FINANCEIRO ===========")
         escreval("Entradas: R$ ", entradasCaixa:2:2)
         escreval("Saídas:   R$ ", saidasCaixa:2:2)
         escreval("Saldo:    R$ ", saldoCaixa:2:2)
         escreval("---------------------------------------------")
         escreval("----- Despesas da Lotérica -----")
         se totalDespesasLoterica = 0 entao
            escreval("Nenhuma registrada.")
         senao
            para i de 1 ate totalDespesasLoterica faca
               escreval(i, ": ", tipoDespesaLoterica[i], " | ", nomeDespesaLoterica[i], " | R$ ", valorDespesaLoterica[i]:2:2)
            fimpara
         fimse
         escreval("----- Funcionários -----")
         se totalFuncionarios = 0 entao
            escreval("Nenhum registrado.")
         senao
            para i de 1 ate totalFuncionarios faca
               escreval(i, ": ", nomeFuncionario[i], " | ", funcaoFuncionario[i], " | R$ ", salarioFuncionario[i]:2:2)
            fimpara
         fimse
         escreval("=============================================")
         escreval("Pressione ENTER para continuar...")
         leia(tecla)
      fimse

   ate opcaoMenu = 0

FimAlgoritmo

