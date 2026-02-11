Algoritmo "Sistema_Completo_Cadastro_Controle"
// Disciplina: [Linguagem e Lógica de Programação]
// Professor: Hudson Neves
// Descrição: Aqui você descreve o que o programa faz! (função)
// Autor(a): Luis Eduardo de Sousa
// Data atual: 13/05/2025

Var
    // Módulo Clientes
    nomeCliente: vetor [1..10] de caractere
    cpfCliente: vetor [1..10] de caractere
    telCliente: vetor [1..10] de caractere
    totalClientes, i: inteiro

    // Módulo Produtos
    nomeProduto: vetor [1..10] de caractere
    codProduto: vetor [1..10] de inteiro
    precoProduto: vetor [1..10] de real
    totalProdutos: inteiro

    // Módulo Financeiro
    tipoTransacao: vetor [1..10] de caractere
    valorTransacao: vetor [1..10] de real
    totalTransacoes: inteiro
    saldo: real

    // Variáveis de controle
    opcaoPrincipal, opcaoCliente, opcaoProduto, opcaoFinanceiro: inteiro
    nomeBusca: caractere
    codBusca: inteiro

Inicio
    totalClientes <- 0
    totalProdutos <- 0
    totalTransacoes <- 0
    saldo <- 0

    // Menu principal
    repita
        escreval("========== Menu Principal ==========")
        escreval("1 - Módulo de Clientes")
        escreval("2 - Módulo de Produtos")
        escreval("3 - Módulo Financeiro")
        escreval("4 - Sair")
        escreva("Escolha uma opção: ")
        leia(opcaoPrincipal)

        // Módulo de Clientes
        se opcaoPrincipal = 1 entao
            repita
                escreval("=== Módulo de Clientes ===")
                escreval("1 - Cadastrar Cliente")
                escreval("2 - Listar Clientes")
                escreval("3 - Buscar Cliente por Nome")
                escreval("4 - Voltar")
                escreva("Escolha: ")
                leia(opcaoCliente)

                se opcaoCliente = 1 entao
                    se totalClientes < 10 entao
                        totalClientes <- totalClientes + 1
                        escreva("Nome: ")
                        leia(nomeCliente[totalClientes])
                        escreva("CPF: ")
                        leia(cpfCliente[totalClientes])
                        escreva("Telefone: ")
                        leia(telCliente[totalClientes])
                    senao
                        escreval("Limite de clientes atingido!")
                    fimse

                senao
                    se opcaoCliente = 2 entao
                        para i de 1 ate totalClientes faca
                            escreval("Cliente ", i)
                            escreval("Nome: ", nomeCliente[i])
                            escreval("CPF: ", cpfCliente[i])
                            escreval("Telefone: ", telCliente[i])
                            escreval("-------------------------")
                        fimpara

                    senao
                        se opcaoCliente = 3 entao
                            escreva("Digite o nome para buscar: ")
                            leia(nomeBusca)
                            para i de 1 ate totalClientes faca
                                se nomeCliente[i] = nomeBusca entao
                                    escreval("Encontrado:")
                                    escreval("Nome: ", nomeCliente[i])
                                    escreval("CPF: ", cpfCliente[i])
                                    escreval("Telefone: ", telCliente[i])
                                fimse
                            fimpara
                        fimse
                    fimse
                fimse
            ate opcaoCliente = 4

        // Módulo de Produtos
        senao
            se opcaoPrincipal = 2 entao
                repita
                    escreval("=== Módulo de Produtos ===")
                    escreval("1 - Cadastrar Produto")
                    escreval("2 - Listar Produtos")
                    escreval("3 - Consultar por Código")
                    escreval("4 - Voltar")
                    escreva("Escolha: ")
                    leia(opcaoProduto)

                    se opcaoProduto = 1 entao
                        se totalProdutos < 10 entao
                            totalProdutos <- totalProdutos + 1
                            escreva("Nome: ")
                            leia(nomeProduto[totalProdutos])
                            escreva("Código: ")
                            leia(codProduto[totalProdutos])
                            escreva("Preço: ")
                            leia(precoProduto[totalProdutos])
                        senao
                            escreval("Limite de produtos atingido!")
                        fimse

                    senao
                        se opcaoProduto = 2 entao
                            para i de 1 ate totalProdutos faca
                                escreval("Produto ", i)
                                escreval("Nome: ", nomeProduto[i])
                                escreval("Código: ", codProduto[i])
                                escreval("Preço: R$", precoProduto[i])
                                escreval("-------------------------")
                            fimpara

                        senao
                            se opcaoProduto = 3 entao
                                escreva("Digite o código do produto: ")
                                leia(codBusca)
                                para i de 1 ate totalProdutos faca
                                    se codProduto[i] = codBusca entao
                                        escreval("Produto encontrado:")
                                        escreval("Nome: ", nomeProduto[i])
                                        escreval("Preço: R$", precoProduto[i])
                                    fimse
                                fimpara
                            fimse
                        fimse
                    fimse
                ate opcaoProduto = 4

            // Módulo Financeiro
            senao
                se opcaoPrincipal = 3 entao
                    repita
                        escreval("=== Módulo Financeiro ===")
                        escreval("1 - Cadastrar Transação")
                        escreval("2 - Consultar Saldo")
                        escreval("3 - Listar Transações")
                        escreval("4 - Voltar")
                        escreva("Escolha: ")
                        leia(opcaoFinanceiro)

                        se opcaoFinanceiro = 1 entao
                            se totalTransacoes < 10 entao
                                totalTransacoes <- totalTransacoes + 1
                                escreva("Tipo (R para Recebimento, P para Pagamento): ")
                                leia(tipoTransacao[totalTransacoes])
                                escreva("Valor: ")
                                leia(valorTransacao[totalTransacoes])

                                se (tipoTransacao[totalTransacoes] = "R") ou (tipoTransacao[totalTransacoes] = "r") entao
                                    saldo <- saldo + valorTransacao[totalTransacoes]
                                senao
                                    saldo <- saldo - valorTransacao[totalTransacoes]
                                fimse
                            senao
                                escreval("Limite de transações atingido!")
                            fimse

                        senao
                            se opcaoFinanceiro = 2 entao
                                escreval("Saldo atual: R$", saldo)

                            senao
                                se opcaoFinanceiro = 3 entao
                                    para i de 1 ate totalTransacoes faca
                                        escreval("Transação ", i)
                                        escreval("Tipo: ", tipoTransacao[i])
                                        escreval("Valor: R$", valorTransacao[i])
                                        escreval("-------------------------")
                                    fimpara
                                fimse
                            fimse
                        fimse
                    ate opcaoFinanceiro = 4
                fimse
            fimse
        fimse
    ate opcaoPrincipal = 4

    escreval("Sistema finalizado. Obrigado!")

Fimalgoritmo
