Algoritmo "Controle_Caixa_Financas_V2"
// Disciplina        : [Linguagem e Lógica de Programação]
// Professor         : Antonio Carlos Nicolodi
// Projeto           : Módulo Financeiro - Agência Lotérica
// Autores           : William dos Santos, João Victor Lino, Guilherme, Luiz Eduardo
// Professor         : Hudson Neves
// Data (original)   : 27/05/2025
// Data (revisão)    : 29/05/2025 - Revisado e Corrigido

Var
    // variáveis para login
    login, senha: caractere

    // controle geral de menus
    opcaoMenu, opcaoCaixa, menuEntrada, menuSaida, menuPagamento: inteiro
    i, j: inteiro

    // Pause de Telas
    dummy: caractere

    // controle de caixa (Entradas)
    totalContas, totalJogos, totalDeposito: inteiro
    nomeContas: vetor[1..10] de caractere
    valorConta: vetor[1..10] de real
    nomeJogo: vetor[1..10] de caractere
    qtdBilhetes: vetor[1..10] de inteiro
    valorJogoUni: vetor[1..10] de real
    valorTotalJogo, totalEntradas: real // valorTotalJogo é usado por item, totalEntradas para o geral

    // Variáveis para depósitos
    nomeCliente: vetor[1..10] de caractere
    cpfCliente: vetor[1..10] de caractere
    contaCliente: vetor[1..10] de caractere
    valorCliente: vetor[1..10] de real

    // controle de caixa (Saídas)
    nomePremiacao, nomeComissao: vetor[1..10] de caractere
    valorPremiacao, valorComissao: vetor[1..10] de real
    totalSaidas, totalComissao, totalSaques: inteiro
    // totalValor, totalValorComissao, valorSaqueTotal: real // Removidas, pois valorTotalSaidas acumula tudo
    nomeClienteSaque, cpfClienteSaque, contaClienteSaque: vetor[1..10] de caractere
    valorClienteSaque: vetor[1..10] de real
    valorTotalSaidas: real // Acumula todas as saídas do caixa (premiação, comissão, saque)

    //Saldo final do CAIXA (apenas entradas e saídas do caixa)
    saldoFinal: real

    //Pagamentos - Despesas da Loja
    totalDespesas: inteiro
    nomeProduto: vetor[1..10] de caractere
    valorProduto: vetor[1..10] de real
    ValorTotalDespesas: real // Acumula o total das despesas da loja
    qtdProduto: vetor[1..10] de inteiro
    // totalProduto: real // Removida, não é necessária, ValorTotalDespesas já faz a soma

    //Pagamentos - Despesas de Funcionários
    totalPagamentosFunc: inteiro
    nomeFuncionario: vetor[1..10] de caractere
    cpfFuncionario: vetor[1..10] de caractere
    cargoFuncionario: vetor[1..10] de caractere
    valorPagamentoFunc: vetor[1..10] de real
    totalValorPagamentosFunc: real // Acumula o total dos pagamentos a funcionários

    // Relatórios Finais - Balanço Geral
    receitaLiquidaSimples: real
    saldoTotalDespesasOperacionais: real // Soma das despesas da loja e de funcionários

Inicio
    // Inicialização de todas as variáveis contadoras e totalizadoras
    totalContas := 0
    totalJogos := 0
    totalDeposito := 0
    totalEntradas := 0
    totalSaidas := 0
    totalComissao := 0
    totalSaques := 0
    valorTotalSaidas := 0
    saldoFinal := 0
    totalDespesas := 0
    ValorTotalDespesas := 0
    totalPagamentosFunc := 0
    totalValorPagamentosFunc := 0
    receitaLiquidaSimples := 0
    saldoTotalDespesasOperacionais := 0

    limpatela
    escreval("====================================================")
    escreval("|             CASA DA SORTE LTDA                 |")
    escreval("|          SISTEMA DE CONTROLE FINANCEIRO        |")
    escreval("====================================================")
    escreval("")
    escreva("Login de acesso: ")
    leia(login)
    escreva("Senha: ")
    leia(senha)

    se (login = "admin") e (senha = "1234") entao
        repita
            limpatela
            escreval("====================================================")
            escreval("|              PAINEL ADMINISTRATIVO             |")
            escreval("====================================================")
            escreval("| 1 - Controle de Caixa                           |")
            escreval("| 2 - Pagamentos de Despesas                      |")
            escreval("| 3 - Relatórios                                  |") // Atualizado
            escreval("| 0 - Finalizar o acesso                          |")
            escreval("----------------------------------------------------")
            escreva("Escolha uma opção: ")
            leia(opcaoMenu)

            // CONTROLE DE CAIXA
            se opcaoMenu = 1 entao
                repita
                    limpatela
                    escreval("====================================================")
                    escreval("|               CONTROLE DE CAIXA                |")
                    escreval("====================================================")
                    escreval("| 1 - Registrar Entradas                          |")
                    escreval("| 2 - Registrar Saídas                            |")
                    escreval("| 3 - Mostrar o Saldo do caixa final              |")
                    escreval("| 0 - Voltar ao Menu Principal                    |")
                    escreval("----------------------------------------------------")
                    escreva("Escolha uma opção: ")
                    leia(opcaoCaixa)

                    // REGISTRAR ENTRADAS
                    se opcaoCaixa = 1 entao
                        repita
                            limpatela
                            escreval("====================================================")
                            escreval("|                REGISTRAR ENTRADAS              |")
                            escreval("====================================================")
                            escreval("| 1 - Recebimento de Contas                       |")
                            escreval("| 2 - Venda de Jogos                              |")
                            escreval("| 3 - Depósitos                                   |")
                            escreval("| 4 - Mostrar Valor Total de Entradas             |")
                            escreval("| 0 - Voltar ao menu anterior                     |")
                            escreval("----------------------------------------------------")
                            escreva("Escolha uma opção: ")
                            leia(menuEntrada)

                            // Registro de recebimento de contas
                            se menuEntrada = 1 entao
                                limpatela
                                escreval("--------- Registro de Recebimento de Contas --------")
                                se totalContas < 10 entao
                                    totalContas := totalContas + 1
                                    escreva("Nome da conta (ex: conta de luz): ")
                                    leia(nomeContas[totalContas])
                                    escreva("Valor pago (R$): ")
                                    leia(valorConta[totalContas])
                                    escreval("Conta registrada com sucesso!")
                                senao
                                    escreval("Limite de registros atingido (10).")
                                fimse
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Registro de venda de jogo
                            se menuEntrada = 2 entao
                                limpatela
                                escreval("-------------- Registro de Venda de Jogo --------------")
                                se totalJogos < 10 entao
                                    totalJogos := totalJogos + 1
                                    escreva("Tipo de jogo (ex: Mega-Sena): ")
                                    leia(nomeJogo[totalJogos])
                                    escreva("Quantidade de bilhetes: ")
                                    leia(qtdBilhetes[totalJogos])
                                    escreva("Valor unitário do bilhete (R$): ")
                                    leia(valorJogoUni[totalJogos])
                                    valorTotalJogo := qtdBilhetes[totalJogos] * valorJogoUni[totalJogos]
                                    escreval("Venda registrada. Valor total do bilhete: R$ ", valorTotalJogo:4:2)
                                senao
                                    escreval("Limite de jogos atingido (10).")
                                fimse
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Registro de depósitos
                            se menuEntrada = 3 entao
                                limpatela
                                escreval("-------------- Registro de Depósitos --------------")
                                se totalDeposito < 10 entao
                                    totalDeposito := totalDeposito + 1
                                    escreva("Digite o nome do cliente: ")
                                    leia(nomeCliente[totalDeposito])
                                    escreva("Digite o CPF do cliente: ")
                                    leia(cpfCliente[totalDeposito])
                                    escreva("Digite o número da conta: ")
                                    leia(contaCliente[totalDeposito])
                                    escreva("Digite o valor do depósito (R$): ")
                                    leia(valorCliente[totalDeposito])
                                    escreval("Depósito registrado com sucesso!")
                                senao
                                    escreval("Limite de depósitos atingido (10).")
                                fimse
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Mostrar Valor Total de Entradas
                            se menuEntrada = 4 entao
                                limpatela
                                totalEntradas := 0 // Resetar para recalcular
                                para i de 1 ate totalContas faca
                                    totalEntradas := totalEntradas + valorConta[i]
                                fimpara
                                para i de 1 ate totalJogos faca
                                    totalEntradas := totalEntradas + (qtdBilhetes[i] * valorJogoUni[i])
                                fimpara
                                para i de 1 ate totalDeposito faca
                                    totalEntradas := totalEntradas + valorCliente[i]
                                fimpara
                                escreval("============== Total de Entradas ================")
                                escreval("Valor total acumulado: R$ ", totalEntradas:8:2)
                                escreval("=================================================")
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse
                        ate menuEntrada = 0
                    fimse

                    // REGISTRAR SAÍDAS
                    se opcaoCaixa = 2 entao
                        repita
                            limpatela
                            escreval("====================================================")
                            escreval("|                 REGISTRAR SAÍDAS               |")
                            escreval("====================================================")
                            escreval("| 1 - Premiação                                   |")
                            escreval("| 2 - Comissão                                    |")
                            escreval("| 3 - Saque                                       |")
                            escreval("| 4 - Mostrar Valor Total de Saídas               |")
                            escreval("| 0 - Voltar ao menu anterior                     |")
                            escreval("----------------------------------------------------")
                            escreva("Escolha uma opção: ")
                            leia(menuSaida)

                            // Registro de premiações
                            se menuSaida = 1 entao
                                limpatela
                                escreval("------------- Registro de Premiações -------------")
                                se totalSaidas < 10 entao
                                    totalSaidas := totalSaidas + 1
                                    escreva("Insira o nome da premiação (ex: Mega-Sena): ")
                                    leia(nomePremiacao[totalSaidas])
                                    escreva("Digite o valor da premiação: ")
                                    leia(valorPremiacao[totalSaidas])
                                    se valorPremiacao[totalSaidas] >= 2259.20 entao
                                        escreval("Avisar ao cliente: o prêmio deve ser retirado na Agência da Caixa.")
                                    senao
                                        escreval("Prêmio pode ser pago na lotérica.")
                                        // O valor total de saídas já é acumulado no "Mostrar Valor Total de Saídas" e nos relatórios.
                                        // Não é ideal acumular aqui também, pois pode duplicar.
                                        // O que importa é que o valor seja registrado no vetor.
                                    fimse
                                    escreval("Premiação registrada com sucesso!")
                                senao
                                    escreval("Limite de premiações atingido.")
                                fimse
                                escreval()
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Registro de comissões
                            se menuSaida = 2 entao
                                limpatela
                                escreval("------------- Registro de Comissão -------------")
                                se totalComissao < 10 entao
                                    totalComissao := totalComissao + 1
                                    escreva("Nome da comissão (ex: Recarga): ")
                                    leia(nomeComissao[totalComissao])
                                    escreva("Valor total dessa comissão: ")
                                    leia(valorComissao[totalComissao])
                                    escreval("Comissão registrada com sucesso!")
                                senao
                                    escreval("Limite de comissões atingido.")
                                fimse
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Registro de saques
                            se menuSaida = 3 entao
                                limpatela
                                escreval("-------------- Registro de Saques --------------")
                                se totalSaques < 10 entao
                                    totalSaques := totalSaques + 1
                                    escreva("Nome do cliente: ")
                                    leia(nomeClienteSaque[totalSaques])
                                    escreva("CPF do cliente: ")
                                    leia(cpfClienteSaque[totalSaques])
                                    escreva("Número da conta: ")
                                    leia(contaClienteSaque[totalSaques])
                                    escreva("Valor do saque (R$): ")
                                    leia(valorClienteSaque[totalSaques])
                                    escreval("Saque registrado com sucesso!")
                                senao
                                    escreval("Limite de saques atingido.")
                                fimse
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse

                            // Mostrar Valor Total de Saídas
                            se menuSaida = 4 entao
                                limpatela
                                valorTotalSaidas := 0 // Resetar para recalcular
                                para j de 1 ate totalSaidas faca
                                    // Apenas prêmios pagos no caixa entram na soma
                                    se valorPremiacao[j] < 2259.20 entao
                                        valorTotalSaidas := valorTotalSaidas + valorPremiacao[j]
                                    fimse
                                fimpara
                                para j de 1 ate totalComissao faca
                                    valorTotalSaidas := valorTotalSaidas + valorComissao[j]
                                fimpara
                                para j de 1 ate totalSaques faca
                                    valorTotalSaidas := valorTotalSaidas + valorClienteSaque[j]
                                fimpara
                                escreval("============== Total de Saídas ================")
                                escreval("Valor total acumulado: R$ ", valorTotalSaidas:8:2)
                                escreval("===============================================")
                                escreval("Pressione ENTER para continuar...")
                                leia(dummy)
                            fimse
                        ate menuSaida = 0
                    fimse

                    // MOSTRAR O SALDO FINAL DO CAIXA
                    se opcaoCaixa = 3 entao
                        limpatela
                        // Recalcula totais antes de exibir o saldo para garantir precisão.
                        totalEntradas := 0 // Resetar para recalcular
                        para i de 1 ate totalContas faca
                            totalEntradas := totalEntradas + valorConta[i]
                        fimpara
                        para i de 1 ate totalJogos faca
                            totalEntradas := totalEntradas + (qtdBilhetes[i] * valorJogoUni[i])
                        fimpara
                        para i de 1 ate totalDeposito faca
                            totalEntradas := totalEntradas + valorCliente[i]
                        fimpara

                        valorTotalSaidas := 0 // Resetar para recalcular
                        para j de 1 ate totalSaidas faca
                            se valorPremiacao[j] < 2259.20 entao
                                valorTotalSaidas := valorTotalSaidas + valorPremiacao[j]
                            fimse
                        fimpara
                        para j de 1 ate totalComissao faca
                            valorTotalSaidas := valorTotalSaidas + valorComissao[j]
                        fimpara
                        para j de 1 ate totalSaques faca
                            valorTotalSaidas := valorTotalSaidas + valorClienteSaque[j]
                        fimpara

                        saldoFinal := totalEntradas - valorTotalSaidas

                        escreval("============== Saldo Final de Caixa ===============")
                        escreval("Total de Entradas no Caixa...: R$", totalEntradas:8:2)
                        escreval("Total de Saídas do Caixa....: R$", valorTotalSaidas:8:2)
                        escreval("---------------------------------------------------")
                        escreval("Saldo em Caixa Atual........: R$", saldoFinal:8:2)
                        escreval("===================================================")

                        se saldoFinal > 0 entao
                            escreval("")
                            escreval("Caixa com saldo positivo. Tudo certo para movimentações!")
                        fimse

                        se saldoFinal = 0 entao
                            escreval("")
                            escreval("Não houve movimentação líquida no caixa!")
                        fimse

                        se saldoFinal < 0 entao
                            escreval("")
                            escreval("Caixa negativado, ATENÇÃO! Verifique as movimentações!")
                        fimse

                        escreval("===================================================")
                        escreval("")
                        escreval("Pressione ENTER para continuar...")
                        leia(dummy)
                    fimse
                ate opcaoCaixa = 0
            fimse

            // PAGAMENTOS DE DESPESAS
            se opcaoMenu = 2 entao
                repita
                    limpatela
                    escreval("====================================================")
                    escreval("|                 Menu Pagamentos                |")
                    escreval("====================================================")
                    escreval("| 1 - Mostrar saldo final do caixa                |")
                    escreval("| 2 - Registrar Despesa da loja                   |")
                    escreval("| 3 - Despesas dos funcionários                   |")
                    escreval("| 4 - Listar Despesas                             |") // Atualizado
                    escreval("| 0 - Voltar ao menu anterior                     |")
                    escreval("----------------------------------------------------")
                    escreva("Escolha uma opção: ")
                    leia(menuPagamento)

                    se (menuPagamento = 1) entao
                        limpatela
                        // Recalcula o saldo final antes de mostrar
                        totalEntradas := 0
                        para i de 1 ate totalContas faca
                            totalEntradas := totalEntradas + valorConta[i]
                        fimpara
                        para i de 1 ate totalJogos faca
                            totalEntradas := totalEntradas + (qtdBilhetes[i] * valorJogoUni[i])
                        fimpara
                        para i de 1 ate totalDeposito faca
                            totalEntradas := totalEntradas + valorCliente[i]
                        fimpara

                        valorTotalSaidas := 0
                        para j de 1 ate totalSaidas faca
                            se valorPremiacao[j] < 2259.20 entao
                                valorTotalSaidas := valorTotalSaidas + valorPremiacao[j]
                            fimse
                        fimpara
                        para j de 1 ate totalComissao faca
                            valorTotalSaidas := valorTotalSaidas + valorComissao[j]
                        fimpara
                        para j de 1 ate totalSaques faca
                            valorTotalSaidas := valorTotalSaidas + valorClienteSaque[j]
                        fimpara

                        saldoFinal := totalEntradas - valorTotalSaidas

                        escreval("============== Saldo Final de Caixa ================")
                        escreval("Saldo do Caixa Atual: R$ ", saldoFinal:8:2)
                        escreval("====================================================")
                        escreval("")
                        escreval("Pressione ENTER para continuar...")
                        leia(dummy)
                    fimse

                    // Registrar Despesa da loja
                    se (menuPagamento = 2) entao
                        limpatela
                        escreval("------------- Registro de Despesas da Loja -------------")
                        se (totalDespesas < 10) entao
                            totalDespesas := totalDespesas + 1
                            escreval("")
                            escreva("Insira o nome do Produto/Serviço: ")
                            leia(nomeProduto[totalDespesas])
                            escreva("Quantidade (se aplicável, ou 1 para item único): ")
                            leia(qtdProduto[totalDespesas])
                            escreva("Valor unitário (R$): ")
                            leia(valorProduto[totalDespesas])
                            escreval("")

                            ValorTotalDespesas := ValorTotalDespesas + (valorProduto[totalDespesas] * qtdProduto[totalDespesas])

                            escreval("Despesa registrada no valor de: R$ ", (valorProduto[totalDespesas] * qtdProduto[totalDespesas]):4:2)
                            escreval("Total acumulado de despesas da loja: R$ ", ValorTotalDespesas:8:2)
                        senao
                            escreval("Limite de registro de despesas atingido.")
                        fimse
                        escreval("")
                        escreval("Pressione ENTER para continuar...")
                        leia(dummy)
                    fimse

                    // Despesas dos funcionários
                    se (menuPagamento = 3) entao
                        limpatela
                        escreval("--------- Registro de Pagamento de Funcionário ---------")

                        se (totalPagamentosFunc < 10) entao
                            totalPagamentosFunc := totalPagamentosFunc + 1

                            escreval("")
                            escreva("Nome do funcionário: ")
                            leia(nomeFuncionario[totalPagamentosFunc])

                            escreva("CPF do funcionário: ")
                            leia(cpfFuncionario[totalPagamentosFunc])

                            escreva("Cargo do funcionário: ")
                            leia(cargoFuncionario[totalPagamentosFunc])

                            escreva("Valor do pagamento (Salário, Adiantamento, etc): R$ ")
                            leia(valorPagamentoFunc[totalPagamentosFunc])

                            totalValorPagamentosFunc := totalValorPagamentosFunc + valorPagamentoFunc[totalPagamentosFunc]

                            escreval("")
                            escreval("Pagamento registrado com sucesso!")
                            escreval("Total de pagamentos a funcionários até agora: R$ ", totalValorPagamentosFunc:8:2)
                        senao
                            escreval("Limite de registros de pagamento atingido (10).")
                        fimse

                        escreval("")
                        escreval("Pressione ENTER para continuar...")
                        leia(dummy)
                    fimse

                    // Listar Despesas (Loja e Funcionários)
                    se (menuPagamento = 4) entao
                        limpatela
                        escreval("====================================================")
                        escreval("|             RELATÓRIO DE DESPESAS              |")
                        escreval("====================================================")
                        escreval("")

                        // Listar despesas da loja
                        escreval("--- Detalhe das Despesas da Loja ---")
                        se totalDespesas = 0 entao
                            escreval("Nenhuma despesa da loja registrada.")
                        senao
                            para i de 1 ate totalDespesas faca
                                escreval("Produto: ", nomeProduto[i], " | Qtd: ", qtdProduto[i], " | Valor Uni: R$", valorProduto[i]:4:2, " | Total: R$", (valorProduto[i] * qtdProduto[i]):4:2)
                            fimpara
                        fimse
                        escreval("Total Acumulado Despesas da Loja: R$", ValorTotalDespesas:8:2)
                        escreval("")

                        // Listar despesas de funcionários
                        escreval("--- Detalhe das Despesas de Funcionários ---")
                        se totalPagamentosFunc = 0 entao
                            escreval("Nenhuma despesa de funcionário registrada.")
                        senao
                            para i de 1 ate totalPagamentosFunc faca
                                escreval("Funcionário: ", nomeFuncionario[i], " | Cargo: ", cargoFuncionario[i], " | Valor Pago: R$", valorPagamentoFunc[i]:4:2)
                            fimpara
                        fimse
                        escreval("Total Acumulado Pagamentos a Funcionários: R$", totalValorPagamentosFunc:8:2)
                        escreval("")

                        // Mostrar o saldo total das despesas operacionais (soma das despesas da loja e funcionários)
                        saldoTotalDespesasOperacionais := ValorTotalDespesas + totalValorPagamentosFunc
                        escreval("====================================================")
                        escreval("Total Geral de Despesas Operacionais: R$", saldoTotalDespesasOperacionais:8:2)
                        escreval("====================================================")
                        escreval("")

                        escreval("Pressione ENTER para continuar...")
                        leia(dummy)
                    fimse
                ate menuPagamento = 0
            fimse

            // RELATÓRIOS (Opção 3 do Menu Principal)
            se opcaoMenu = 3 entao
                limpatela
                escreval("====================================================")
                escreval("|             RELATÓRIOS FINANCEIROS             |")
                escreval("====================================================")
                escreval("")

                // RECALCULAR TOTAIS PARA GARANTIR PRECISÃO DOS RELATÓRIOS
                totalEntradas := 0
                para i de 1 ate totalContas faca
                    totalEntradas := totalEntradas + valorConta[i]
                fimpara
                para i de 1 ate totalJogos faca
                    totalEntradas := totalEntradas + (qtdBilhetes[i] * valorJogoUni[i])
                fimpara
                para i de 1 ate totalDeposito faca
                    totalEntradas := totalEntradas + valorCliente[i]
                fimpara

                valorTotalSaidas := 0
                para j de 1 ate totalSaidas faca
                    se valorPremiacao[j] < 2259.20 entao // Apenas prêmios pagos no caixa
                        valorTotalSaidas := valorTotalSaidas + valorPremiacao[j]
                    fimse
                fimpara
                para j de 1 ate totalComissao faca
                    valorTotalSaidas := valorTotalSaidas + valorComissao[j]
                fimpara
                para j de 1 ate totalSaques faca
                    valorTotalSaidas := valorTotalSaidas + valorClienteSaque[j]
                fimpara

                // Exibir Entradas e Saídas do Caixa
                escreval("--- Movimentação de Caixa ---")
                escreval("Total de Entradas no Caixa: R$", totalEntradas:8:2)
                escreval("Total de Saídas do Caixa..: R$", valorTotalSaidas:8:2)
                escreval("----------------------------------------------------")
                saldoFinal := totalEntradas - valorTotalSaidas // Calcula o saldo do caixa para exibir no relatório
                escreval("Saldo Líquido do Caixa....: R$", saldoFinal:8:2)
                escreval("")

                // Listar despesas da loja
                escreval("--- Detalhe das Despesas da Loja ---")
                se totalDespesas = 0 entao
                    escreval("Nenhuma despesa da loja registrada.")
                senao
                    para i de 1 ate totalDespesas faca
                        escreval("Produto: ", nomeProduto[i], " | Qtd: ", qtdProduto[i], " | Valor Uni: R$", valorProduto[i]:4:2, " | Total: R$", (valorProduto[i] * qtdProduto[i]):4:2)
                    fimpara
                fimse
                escreval("Total Acumulado Despesas da Loja: R$", ValorTotalDespesas:8:2)
                escreval("")

                // Listar despesas de funcionários
                escreval("--- Detalhe das Despesas de Funcionários ---")
                se totalPagamentosFunc = 0 entao
                    escreval("Nenhuma despesa de funcionário registrada.")
                senao
                    para i de 1 ate totalPagamentosFunc faca
                        escreval("Funcionário: ", nomeFuncionario[i], " | Cargo: ", cargoFuncionario[i], " | Valor Pago: R$", valorPagamentoFunc[i]:4:2)
                    fimpara
                fimse
                escreval("Total Acumulado Pagamentos a Funcionários: R$", totalValorPagamentosFunc:8:2)
                escreval("")

                // Calcular a Receita Simples (Entradas - Saídas - Despesas da Loja - Despesas Funcionários)
                // É importante notar que no seu algoritmo, as 'Saídas' (premiação, comissão, saque) já são uma forma de despesa/redução do caixa.
                // A "Despesa da Loja" e "Despesa Funcionário" são outros tipos de despesas.
                // Para uma "receita simples", vamos considerar: Entradas - (todas as Saídas do caixa + Despesas da Loja + Despesas de Funcionários)

                saldoTotalDespesasOperacionais := ValorTotalDespesas + totalValorPagamentosFunc
                receitaLiquidaSimples := totalEntradas - valorTotalSaidas - saldoTotalDespesasOperacionais

                escreval("====================================================")
                escreval("              RESUMO FINANCEIRO GERAL             ")
                escreval("====================================================")
                escreval("Total de Entradas no Caixa....: R$", totalEntradas:8:2)
                escreval("Total de Saídas do Caixa......: R$", valorTotalSaidas:8:2)
                escreval("Total Despesas da Loja........: R$", ValorTotalDespesas:8:2)
                escreval("Total Despesas de Funcionários: R$", totalValorPagamentosFunc:8:2)
                escreval("----------------------------------------------------")
                escreval("RECEITA LÍQUIDA SIMPLES.......: R$", receitaLiquidaSimples:8:2)
                escreval("====================================================")
                escreval("")

                escreval("Pressione ENTER para continuar...")
                leia(dummy)
            fimse

        ate opcaoMenu = 0

        escreval("Sessão finalizada. Obrigado por utilizar o sistema!")
    senao
        escreval("")
        escreval("====================================================")
        escreval("|      ACESSO NEGADO - CREDENCIAIS INVÁLIDAS       |")
        escreval("|        Por favor, contate o administrador.       |")
        escreval("====================================================")
    fimse
Fimalgoritmo