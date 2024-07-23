
# Gerenciador de Projetos


Bem-vindo ao Gerenciador de Projetos! Este é um sistema robusto para gerenciar projetos de maneira eficiente e organizada. Desenvolvido com as melhores práticas de desenvolvimento e um design amigável, o Gerenciador de Projetos é a ferramenta perfeita para equipes que buscam produtividade e colaboração.

## 📋 Funcionalidades
Criação e gerenciamento de projetos: Crie novos projetos e organize suas tarefas de maneira eficiente.
Atribuição de tarefas: Atribua tarefas aos membros da equipe e acompanhe o progresso.
Calendário integrado: Visualize prazos e eventos importantes diretamente no calendário.
Comentários e discussões: Comunique-se com a equipe diretamente nas tarefas.
Notificações em tempo real: Mantenha-se atualizado com notificações instantâneas.

## 🚀 Tecnologias Utilizadas

Back-end: Java, Servlets

Front-end: JSP, HTML, CSS, JavaScript

Banco de Dados: MySQL

Gerenciamento de Dependências: Maven

## 📦 Estrutura do Projeto
```bash
Gerenciador-de-Projetos/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── parmaxxx/
│   │   │           └── gerenciadordeprojetos/
│   │   │               ├── controller/
│   │   │               ├── model/
│   │   │               ├── service/
│   │   │               └── dao/
│   │   ├── resources/
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       ├── css/
│   │       ├── js/
│   │       └── pages/
└── pom.xml
```
## ⚙️ Como Rodar o Projeto

Clone o repositório:
```bash
git clone https://github.com/Parmaxxx/Gerenciador-de-Projetos.git
```
Importe o projeto na sua IDE preferida.

Configure o banco de dados MySQL:

Crie um banco de dados chamado gerenciador_de_projetos.

Execute o script SQL em src/main/resources/database.
sql para criar as tabelas.

Configure as credenciais do banco de dados no arquivo src/main/resources/db.properties.

Execute o projeto:

Utilize o Maven para construir o projeto.

Execute o servidor de aplicação (Tomcat).

Acesse a aplicação:

Abra o navegador e vá para http://localhost:8080/Gerenciador-de-Projetos.


### 🤝 Contribuições são bem-vindas!



## Sera necessario para utilizar a aplicação os seguintes requisitos
JDK 21.0.2 Hotspot ou mais recente;
Apache TomCat 10- no disco local C: ;
MySQL Server; 

Criação do Banco de Dados
Para configurar o banco de dados, siga os passos abaixo:
1.	Crie uma database chamada gerenciamento_projetos.
2.	Crie as tabelas usuarios e projetos utilizando o seguinte script:
CREATE DATABASE gerenciamento_projetos;

USE gerenciamento_projetos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_final DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


Funcionalidades Implementadas
1. Autenticação de Usuários
•	Descrição: Os usuários podem se cadastrar e fazer login no sistema para acessar suas tarefas.
•	Implementação:
o	Servlets Utilizadas:
	UsuarioController.java: Responsável por gerenciar as requisições de login e cadastro de usuários.
o	Classes:
	Usuario.java: Modelo que representa o usuário no sistema.
	UsuarioDAO.java: Classe que implementa o padrão DAO para acesso ao banco de dados.
o	JSP Relacionados:
	login.jsp: Página de login do usuário.
	cadastroUsuario.jsp: Página de cadastro do usuário.
	editarLogin.jsp: Página para editar informações do usuário.
3. Gerenciamento de Projetos
•	Descrição: Usuários autenticados podem criar e visualizar seus projetos. Cada projeto contém título, data final, descrição e status.
•	Implementação:
o	Servlets Utilizadas:
	ProjetoController.java: Responsável por gerenciar as requisições de criação e visualização de projetos.
o	Classes:
	Projeto.java: Modelo que representa um projeto no sistema.
	ProjetoDAO.java: Classe que implementa o padrão DAO para acesso ao banco de dados.
o	JSP Relacionados:
	criarProjeto.jsp: Página de criação de projetos.
	listarProjetos.jsp: Página de visualização dos detalhes de um projeto, e editar e excluir o projeto selecionado.
	editarProjetos.jsp: Página de edição de projetos.
4. Listagem de Projetos
•	Descrição: Página para visualização de todos os projetos.
•	Implementação:
o	Servlets Utilizadas:
	ProjetoController.java: Responsável por gerenciar as requisições para listar todos os projetos do usuário.
o	JSP Relacionados:
	listarTodosProjetos.jsp: Página que exibe todos os projetos do usuário autenticado.
o	Comentários: A listagem de projetos é eficiente, exibindo os projetos em uma tabela com paginação para facilitar a navegação.
5. Persistência de Dados
•	Descrição: Todas as informações sobre usuários e projetos são armazenadas em um banco de dados MySQL, utilizando o padrão DAO para acessar e manipular os dados.
•	Implementação:
o	Banco de Dados:
	Configuração: O banco de dados MySQL foi configurado com tabelas para armazenar usuários e projetos.
	Classe Relacionada: Foi utilizado o padrão Factory para implementação da conexão com o banco: ConnectionFactory.java.
