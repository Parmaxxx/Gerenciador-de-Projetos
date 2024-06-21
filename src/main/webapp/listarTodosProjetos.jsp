<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Projeto" %>
<%@ page import="model.DAO.UsuarioDAO" %>

<%
    List<Projeto> projetos = (List<Projeto>) request.getAttribute("projetos");
    UsuarioDAO usuarioDAO = new UsuarioDAO();
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Todos os Projetos</title>
    <link href="CSS/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="telaProjeto.jsp">
            <img src="Images/logo.png" alt="logo" width="120" height="70" />
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="editarLogin.jsp">Editar Conta</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="projeto?acao=listarTodos">Listar Todos Projetos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="projeto?acao=listar">Meus Projetos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="criarProjeto.jsp">Criar Projeto</a>
                </li>
            </ul>
            <form action="usuario?acao=logout" method="post" class="ml-auto">
                <button class="btn btn-danger btn-lg" type="submit">Deslogar</button>
            </form>
        </div>
    </div>
</nav>

<div class="bg">
    <br /><br />
    <div class="container">
        <div class="row">
            <% for (Projeto projeto : projetos) { %>
            <div class="col-sm-4 mb-3 mb-sm-0 text-center mb-3" style="width: 18rem">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= projeto.getTitulo() %></h5>
                        <p class="card-text"><%= projeto.getDescricao() %></p>
                        <p class="card-text">Data Final: <%= projeto.getDataFinal() %></p>
                        <p class="card-text">Status: <%= projeto.getStatus() %></p>
                        <p class="card-text">Usuário: <%= usuarioDAO.buscarUsuarioPorId(projeto.getUsuarioId()).getNome() %></p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
