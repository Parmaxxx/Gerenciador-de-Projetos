<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Editar Conta</title>

    <!-- Bootstrap  -->
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

            <h2>Editar Conta</h2>

            <img id="profile-img" class="profile-img-card" src="Images/logo.png" alt="" />
            <p id="profile-name" class="profile-name-card"></p>

            <form class="form-signin" action="UsuarioController?acao=editar" method="post"> <%-- Modificado para enviar para o servlet de edição --%>
                <input type="hidden" name="id" value="<%= usuario.getId() %>"> <%-- Campo oculto para o ID do usuário --%>
                <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome" value="<%= usuario.getNome() %>" required autofocus />
                <input type="email" name="email" id="login" class="form-control" placeholder="Email" value="<%= usuario.getEmail() %>" required />
                <input type="password" name="senha" id="senha" class="form-control" placeholder="Senha" required />
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Salvar Alterações</button>
            </form>
            <a href="telaProjeto.jsp" class="forgot-password">Voltar</a>
        </div>
    </div>
</div>
</body>
</html>

