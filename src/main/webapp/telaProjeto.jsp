

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario"); // Use o objeto session existente
    if (usuario == null) {
        response.sendRedirect("index.jsp"); // Redireciona se não logado
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bem-vindo ao ProjectMaster</title>
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

<div class="welcome-text">
    <h1>Bem-vindo ao ProjectMaster</h1>
    <h2><%= usuario.getNome() %></h2>
    <form action="usuario?acao=logout" method="post" style="margin-top: 20px;">
        <button class="btn btn-danger btn-lg" type="submit">Deslogar</button>
    </form>
</div>
</div>
</body>
</html>