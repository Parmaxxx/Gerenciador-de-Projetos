Sistema de Gerenciamento de Projetos
Sera necessario para utilizar a aplicação os seguintes requisitos
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
