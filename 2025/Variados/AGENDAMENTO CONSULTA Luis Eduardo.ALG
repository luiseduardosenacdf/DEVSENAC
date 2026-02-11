Algoritmo "agendamento consulta"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Hudson Neves
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Luis Eduardo de Sousa
// Data atual  : 12/05/2025

Var
    nomePaciente: vetor [1 .. 100] de caractere
    idadePaciente: vetor [1 .. 100] de inteiro
    especialidade: vetor [1 .. 100] de caractere
    diaConsulta: vetor [1 .. 100] de caractere
    opcao: inteiro
    continuar: caractere
    i, total: inteiro

Inicio
    total <- 0
    continuar <- "s"

    enquanto (continuar = "s") ou (continuar = "S") faca
        escreval ("")
        escreval ("==== Menu de Agendamento ====")
        escreval ("1 - Cadastrar nova consulta")
        escreval ("2 - Listar consultas agendadas")
        escreval ("3 - Sair do sistema")
        escreva  ("Escolha uma opcao: ")
        leia (opcao)

        se opcao = 1 entao
            total <- total + 1
            escreval ("")
            escreva ("Digite o nome do paciente: ")
            leia (nomePaciente[total])
            escreva ("Digite a idade do paciente: ")
            leia (idadePaciente[total])
            escreva ("Digite a especialidade desejada: ")
            leia (especialidade[total])
            escreva ("Digite o dia da consulta: ")
            leia (diaConsulta[total])
            escreval ("Consulta cadastrada com sucesso!")

        senao
            se opcao = 2 entao
                escreval ("")
                se total = 0 entao
                    escreval ("Nenhuma consulta agendada ainda.")
                senao
                    para i de 1 ate total faca
                        escreval ("--------------------------------")
                        escreval ("Consulta ", i, ":")
                        escreval ("Nome: ", nomePaciente[i])
                        escreval ("Idade: ", idadePaciente[i])
                        escreval ("Especialidade: ", especialidade[i])
                        escreval ("Dia: ", diaConsulta[i])
                    fimpara
                    escreval ("--------------------------------")
                fimse

            senao
            se opcao = 3 entao
                escreval ("Encerrando o sistema ...")
                continuar <- "n" // Encerra o loop
            senao
                escreval ("Opcao invalida. Tente novamente.")
            fimse
            fimse
        fimse

        escreva ("Deseja voltar ao menu? (s/n): ")
        leia (continuar)
    fimenquanto

Fimalgoritmo
