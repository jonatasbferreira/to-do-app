# Projeto: Aplicativo To-Do List

### Links Úteis

- [Vídeo de demonstração]()
- [Link da Aplicação]()

### Descrição Inicial

Este é um projeto de um aplicativo de gerenciamento de tarefas baseado no conceito de **Quadros Kanban**. Ele foi desenvolvido utilizando **Ruby on Rails 8** no back-end e no front-end foi utilizado **Bootstrap, HTML, CSS e JavaScript**. O objetivo é permitir que os usuários possam criar quadros, organizar tarefas em listas e gerenciar suas atividades de forma intuitiva e visual.

O aplicativo conta com funcionalidades essenciais de criação, edição e exclusão de itens, bem como diferenciais que agregam valor à experiência do usuário.

### Tecnologias Escolhidas:
- Ruby 3.3.5
- Rails 8.0.1
- Bootstrap 5, HTML, CSS e JavaScript

### Requisitos Principais

1. #### Autenticação de Usuários
    - Sistema de login e registro, garantindo que cada quadro seja associado a um usuário específico.
    - O usuário só pode acessar os próprios quadros e as rotas estão protegidas.

2. #### Gestão de Quadros
    - Tela inicial que lista todos os quadros do usuário.
    - Opções para criar e editar os quadros.

3. #### Gestão de Listas
    - Cada quadro começa com 3 listas padrão: A Fazer, Fazendo e Feito.
    - É possível adicionar, remover e editar as listas.

4. #### Gerenciamento de Tarefas
    - Criar tarefas dentro de cada lista.
    - Cada tarefa possui atributos como título, prioridade e data limite.
    - Mover tarefas entre listas arrastando e soltando (drag and drop).
    - Marcar tarefas como concluídas com um checkbox.


### Estrutura de Código e Boas Práticas

- Organização dos Controllers e Rotas: Uso de recursos aninhados para garantir a coerência entre quadros, listas e tarefas.

- Manutenção Facilitada: Código limpo e separado por responsabilidades, seguindo boas práticas do Ruby on Rails.

- Arquitetura: MVC (Movel - View - Controller)


---
### Algumas Imagens da Aplicação

![Home](https://i.ibb.co/ThRyRBY/Captura-de-tela-de-2025-01-14-20-38-45.png "Home")

![Board](https://i.ibb.co/6rdLdTD/Captura-de-tela-de-2025-01-14-20-41-11.png "Board")


### Conclusão
Este é um projeto simples, mas que apresenta uma solução robusta e escalável para o gerenciamento de tarefas pessoais ou profissionais, com foco na usabilidade e eficiência.
