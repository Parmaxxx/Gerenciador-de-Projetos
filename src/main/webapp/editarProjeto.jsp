<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<%@ page import="model.Projeto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<Projeto> projetos = (List<Projeto>) request.getAttribute("projetos");
    if (projetos == null) {
        projetos = new ArrayList<>();
    }
    Projeto projetoEdicao = (Projeto) request.getAttribute("projeto");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Editar Projeto</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link href="CSS/login.css" rel="stylesheet" />
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
<div class="container">
    <div class="card card-container">
        <h2 class="text-center">Editar Projeto</h2>

        <img id="profile-img" class="profile-img-card" src="Images/logo.png" alt="" />
        <p id="profile-name" class="profile-name-card"></p>

        <% if (projetoEdicao != null) { %>
        <form class="form-signin" action="projeto?acao=editar" method="post">
            <input type="hidden" id="id" name="id" value="<%= projetoEdicao.getId() %>">

            <div class="form-group">
                <label for="titulo">Título:</label>
                <input type="text" id="titulo" name="titulo" class="form-control" value="<%= projetoEdicao.getTitulo() %>" required>
            </div>

            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao" class="form-control"  rows="2" cols="25" placeholder="Descrição" style="resize: none;" required><%= projetoEdicao.getDescricao() %></textarea>
            </div>

            <div class="form-group">
                <label for="dataFinal">Data Final:</label>
                <input type="date" id="dataFinal" name="dataFinal" class="form-control" value="<%= projetoEdicao.getDataFinal() %>" required>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" class="form-control" value="<%= projetoEdicao.getStatus() %>" required>
            </div>

            <input type="hidden" id="usuarioId" name="usuarioId" value="<%= usuario.getId() %>">

            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Atualizar Projeto</button>
        </form>
        <% } else { %>
        <form class="form-signin" action="projeto?acao=editar" method="get">
            <div class="form-group">
                <label for="projetoId">Selecione o projeto:</label>
                <select id="projetoId" name="id" class="form-control">
                    <% for (Projeto projeto : projetos) { %>
                    <option value="<%= projeto.getId() %>"><%= projeto.getTitulo() %></option>
                    <% } %>
                </select>
            </div>
            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Editar</button>
        </form>
        <% } %>

        <a href="telaProjeto.jsp" class="forgot-password">Voltar para a Tela Principal</a>
    </div>
</div>
</div>
</body>
</html>
