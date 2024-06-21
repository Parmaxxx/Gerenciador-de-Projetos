<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="bg">
  <div class="welcome-text">
    <h1>Bem-vindo ao ProjectMaster</h1>
    <p>Seu sistema de gerenciamento de projetos inovador</p>
    <%
      // Verifica se o usuário está logado
      if (session.getAttribute("usuario") != null) {
    %>
    <a href="telaProjeto.jsp" class="btn btn-dark btn-lg">Ir para Projetos</a>
    <%
    } else {
    %>
    <a href="login.jsp" class="btn btn-dark btn-lg">Entrar</a>
    <a href="cadastroUsuario.jsp" class="btn btn-light btn-lg">Cadastre-se</a>
    <%
      }
    %>
  </div>
</div>
</body>
</html>
