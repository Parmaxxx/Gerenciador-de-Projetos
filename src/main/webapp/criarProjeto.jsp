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
    <!-- As 3 meta tags acima *devem* vir em primeiro lugar dentro do `head`; qualquer outro conteúdo deve vir *após* essas tags -->
    <title>Criar Novo Projeto</title>

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
        <h2>Criar Novo Projeto</h2>

        <form action="projeto?acao=criar" method="post">
            <label for="titulo">Título:</label><br>
            <input type="text" id="titulo" name="titulo" class="form-control" placeholder="Título" required><br>

            <label for="descricao">Descrição:</label><br>
            <textarea id="descricao" name="descricao" class="form-control" rows="2" cols="25" placeholder="Descrição" style="resize: none;"></textarea>

            <label for="dataFinal">Data Final:</label><br>
            <input type="date" id="dataFinal" name="dataFinal" class="form-control" required><br>

            <label for="status">Status:</label><br>
            <input type="text" id="status" name="status" class="form-control" placeholder="Status" required><br>

            <!-- Campo oculto para o ID do usuário -->
            <input type="hidden" id="usuarioId" name="usuarioId" value="<%= usuario.getId() %>">

            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Criar Projeto</button>
        </form>
    </div>
</div>
</div>
</body>
</html>
