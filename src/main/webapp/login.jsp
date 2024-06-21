<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tela de Login</title>

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />

    <link href="CSS/login.css" rel="stylesheet" />
    <style>

    </style>
</head>
<body>
<div class="bg">

<div class="container">
    <div class="card card-container">
        <h2>Login</h2>

        <img id="profile-img" class="profile-img-card" src="Images/logo.png" alt="" />
        <p id="profile-name" class="profile-name-card"></p>

        <form class="form-signin" action="UsuarioController" method="post">
            <input type="hidden" name="acao" value="login" />
            <span class="reauth-email" id="reauth-email"></span>
            <input type="email" id="nome" class="form-control" placeholder="E-mail" name="email" required autofocus />
            <input type="password" id="senha" class="form-control" placeholder="Senha" name="senha" required />
            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Entrar</button>
        </form>
        <a href="cadastroUsuario.jsp" class="forgot-password">Cadastrar</a>
    </div>
</div>
</div>
</body>
</html>
