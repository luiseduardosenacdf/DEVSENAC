#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

#define MAX 100
#define NOME_LEN 100
#define OBS_LEN 300
#define DATA_LEN 20
#define STATUS_MARCADO 0
#define STATUS_REALIZADO 1
#define STATUS_CANCELADO 2

typedef struct {
    char nome[NOME_LEN];
    int id;
    int cadastrado;
} Jogador, Profissional, Servico;

typedef struct {
    int id;
    int jogador;
    int profissional;
    int servico;
    char data[DATA_LEN];
    int status;
    char observacoes[OBS_LEN];
    int valido;
} Agendamento;

Jogador jogadores[MAX];
Profissional profissionais[MAX];
Servico servicos[MAX];
Agendamento agendamentos[MAX];
int totalJog = 0, totalProf = 0, totalServ = 0, totalAg = 0;
int idAgendamento = 1000;

void limpar_buffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

void menu_principal() {
    printf("\n==== MENU PRINCIPAL ====");
    printf("\n[1] Cadastrar Jogador");
    printf("\n[2] Cadastrar Profissional de Saude");
    printf("\n[3] Cadastrar Servico Medico");
    printf("\n[4] Agendar Atendimento");
    printf("\n[5] Editar/Excluir Agendamento Futuro");
    printf("\n[6] Realizar Atendimento");
    printf("\n[7] Relatorios");
    printf("\n[8] Ver Todos Agendamentos");
    printf("\n[0] Sair\nEscolha: ");
}

void ler_string(char *str, int tamanho) {
    fgets(str, tamanho, stdin);
    str[strcspn(str, "\n")] = 0;
}

void cadastrar_entidade(char *tipo, void *entidade, int *total) {
    if (*total >= MAX) {
        printf("\nLimite de %ss atingido.\n", tipo);
        return;
    }
    printf("Nome do %s: ", tipo);
    limpar_buffer();
    ler_string(((Jogador *)entidade)[*total].nome, NOME_LEN);
    ((Jogador *)entidade)[*total].id = *total + 1;
    ((Jogador *)entidade)[*total].cadastrado = 1;
    printf("%s cadastrado com sucesso!\n", tipo);
    (*total)++;
}

void listar_entidades(void *entidades, int total) {
    for (int i = 0; i < total; i++)
        printf("[%d] ID:%d - %s\n", i, ((Jogador *)entidades)[i].id, ((Jogador *)entidades)[i].nome);
}

void cadastrar_jogador()       { cadastrar_entidade("Jogador", jogadores, &totalJog); }
void cadastrar_profissional()  { cadastrar_entidade("Profissional", profissionais, &totalProf); }
void cadastrar_servico()       { cadastrar_entidade("Servico", servicos, &totalServ); }

int escolher_entidade(const char *tipo, void *lista, int total) {
    listar_entidades(lista, total);
    int idx;
    do {
        printf("Escolha o %s (indice): ", tipo);
        scanf("%d", &idx);
        if (idx < 0 || idx >= total)
            printf("Indice invalido!\n");
    } while (idx < 0 || idx >= total);
    return idx;
}

void agendar_atendimento() {
    if (totalJog == 0 || totalProf == 0 || totalServ == 0) {
        printf("\nNecessario cadastrar jogador, profissional e servico antes.\n");
        return;
    }
    if (totalAg >= MAX) {
        printf("\nLimite de agendamentos atingido.\n");
        return;
    }
    int j = escolher_entidade("jogador", jogadores, totalJog);
    int p = escolher_entidade("profissional", profissionais, totalProf);
    int s = escolher_entidade("servico", servicos, totalServ);

    limpar_buffer();
    printf("Data (DD/MM/AAAA): ");
    ler_string(agendamentos[totalAg].data, DATA_LEN);

    agendamentos[totalAg].id = idAgendamento++;
    agendamentos[totalAg].jogador = j;
    agendamentos[totalAg].profissional = p;
    agendamentos[totalAg].servico = s;
    agendamentos[totalAg].status = STATUS_MARCADO;
    agendamentos[totalAg].valido = 1;
    agendamentos[totalAg].observacoes[0] = '\0';

    printf("Agendamento #%d realizado com sucesso!\n", agendamentos[totalAg].id);
    totalAg++;
}

void editar_excluir_agendamento() {
    printf("\nAgendamentos futuros:\n");
    for (int i = 0; i < totalAg; i++) {
        if (agendamentos[i].valido && agendamentos[i].status == STATUS_MARCADO)
            printf("[%d] #%d - %s com %s para %s em %s\n", i, agendamentos[i].id,
                   jogadores[agendamentos[i].jogador].nome,
                   profissionais[agendamentos[i].profissional].nome,
                   servicos[agendamentos[i].servico].nome,
                   agendamentos[i].data);
    }
    printf("Indice para editar/excluir (-1 para voltar): ");
    int idx; scanf("%d", &idx);
    if (idx < 0 || idx >= totalAg || !agendamentos[idx].valido || agendamentos[idx].status != STATUS_MARCADO) return;

    printf("[1] Editar\n[2] Excluir\nOpcao: ");
    int op; scanf("%d", &op);

    if (op == 1) {
        limpar_buffer();
        printf("Nova data: ");
        ler_string(agendamentos[idx].data, DATA_LEN);
        printf("Editado com sucesso.\n");
    } else if (op == 2) {
        agendamentos[idx].valido = 0;
        printf("Excluido com sucesso.\n");
    }
}

void realizar_atendimento() {
    printf("\nAtendimentos marcados:\n");
    for (int i = 0; i < totalAg; i++) {
        if (agendamentos[i].valido && agendamentos[i].status == STATUS_MARCADO)
            printf("[%d] #%d - %s com %s para %s em %s\n", i, agendamentos[i].id,
                   jogadores[agendamentos[i].jogador].nome,
                   profissionais[agendamentos[i].profissional].nome,
                   servicos[agendamentos[i].servico].nome,
                   agendamentos[i].data);
    }
    printf("Indice para atualizar status (-1 para voltar): ");
    int idx; scanf("%d", &idx);
    if (idx < 0 || idx >= totalAg || !agendamentos[idx].valido || agendamentos[idx].status != STATUS_MARCADO) return;

    int st;
    do {
        printf("[1] Realizado\n[2] Cancelado\nOpcao: ");
        scanf("%d", &st);
        if (st != 1 && st != 2)
            printf("Opcao invalida!\n");
    } while (st != 1 && st != 2);

    agendamentos[idx].status = st;
    limpar_buffer();
    if (st == STATUS_REALIZADO) {
        printf("Observacoes/resultados: ");
        ler_string(agendamentos[idx].observacoes, OBS_LEN);
    } else {
        strcpy(agendamentos[idx].observacoes, "Atendimento cancelado pelo sistema ou usuario.");
    }
    printf("Status atualizado com sucesso.\n");
}

void listar_todos_agendamentos() {
    printf("\nTodos os Agendamentos:\n");
    for (int i = 0; i < totalAg; i++) {
        if (agendamentos[i].valido)
            printf("[#%d] %s com %s para %s em %s | Status: %d | Obs: %s\n",
                   agendamentos[i].id,
                   jogadores[agendamentos[i].jogador].nome,
                   profissionais[agendamentos[i].profissional].nome,
                   servicos[agendamentos[i].servico].nome,
                   agendamentos[i].data,
                   agendamentos[i].status,
                   agendamentos[i].observacoes);
    }
}

void relatorios() {
    printf("\n* Relatorios *\n[1] Por Jogador\n[2] Por Servico\n[3] Por Profissional\nOpcao: ");
    int op, idx; scanf("%d", &op);
    if (op == 1) {
        idx = escolher_entidade("jogador", jogadores, totalJog);
        for (int i = 0; i < totalAg; i++)
            if (agendamentos[i].valido && agendamentos[i].jogador == idx)
                printf("- %s com %s para %s em %s | Status:%d | Obs:%s\n",
                       jogadores[idx].nome,
                       profissionais[agendamentos[i].profissional].nome,
                       servicos[agendamentos[i].servico].nome,
                       agendamentos[i].data,
                       agendamentos[i].status,
                       agendamentos[i].observacoes);
    } else if (op == 2) {
        idx = escolher_entidade("servico", servicos, totalServ);
        for (int i = 0; i < totalAg; i++)
            if (agendamentos[i].valido && agendamentos[i].servico == idx)
                printf("- %s com %s para %s em %s | Status:%d | Obs:%s\n",
                       jogadores[agendamentos[i].jogador].nome,
                       profissionais[agendamentos[i].profissional].nome,
                       servicos[idx].nome,
                       agendamentos[i].data,
                       agendamentos[i].status,
                       agendamentos[i].observacoes);
    } else if (op == 3) {
        idx = escolher_entidade("profissional", profissionais, totalProf);
        for (int i = 0; i < totalAg; i++)
            if (agendamentos[i].valido && agendamentos[i].profissional == idx)
                printf("- %s com %s para %s em %s | Status:%d | Obs:%s\n",
                       jogadores[agendamentos[i].jogador].nome,
                       profissionais[idx].nome,
                       servicos[agendamentos[i].servico].nome,
                       agendamentos[i].data,
                       agendamentos[i].status,
                       agendamentos[i].observacoes);
    }
}

int main() {
    int op;
    do {
        menu_principal();
        scanf("%d", &op);
        switch (op) {
            case 1: cadastrar_jogador(); break;
            case 2: cadastrar_profissional(); break;
            case 3: cadastrar_servico(); break;
            case 4: agendar_atendimento(); break;
            case 5: editar_excluir_agendamento(); break;
            case 6: realizar_atendimento(); break;
            case 7: relatorios(); break;
            case 8: listar_todos_agendamentos(); break;
            case 0: printf("Saindo...\n"); break;
            default: printf("Opcao invalida.\n");
        }
    } while (op != 0);
    return 0;
}
