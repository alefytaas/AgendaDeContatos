# Agenda de Contatos

Este é um projeto simples de uma agenda de contatos em Ruby, que permite ao usuário adicionar, visualizar e salvar. O projeto utiliza conceitos básicos de Ruby, incluindo variáveis, tipos de dados, estruturas de controle, laços, orientação a objetos, leitura e escrita de arquivos.

## Funcionalidades

- **Adicionar Contatos**: Permite adicionar novos contatos à agenda.
- **Visualizar Contatos**: Exibe a lista de contatos salvos.
- **Salvar Contatos**: Salva os contatos em um arquivo para persistência de dados.
- **Mantem o apenas os arquivos que estão em uso no momento excluindo arquivos fora de uso**

## Estrutura do Projeto
- `contato.rb`: Contém o objeto contato e seu método de exibição de contato.
- `agenda.rb`: Contém a lógica principal da agenda de contatos, incluindo métodos para adicionar, visualizar e salvar.
- `main.rb`: Script principal para executar o programa.
- `menu.rb`: Script de menudo para execução das tarefas.
- `./arquivos/`: Diretório onde os arquivos de dados da agenda são armazenados.

## Como Executar

1. Certifique-se de ter o [Ruby](https://www.ruby-lang.org/en/downloads/) instalado no seu sistema.
2. Clone este repositório para o seu diretório local:
    ```sh
    git clone https://github.com/alefytaas/AgendaDeContatos.git
    ```
3. Navegue até o diretório do projeto:
    ```sh
    cd AgendaDeContatos
    ```
4. Execute o script principal:
    ```sh
    ruby main.rb
    ```


## Dependências

- `securerandom`: Utilizado para gerar identificadores únicos para os contatos.


