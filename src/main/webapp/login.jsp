<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<c:set var="x" value="0"></c:set>
	
	<c:forEach items="${listaCarrinho }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	<header>
		<h1>
			Gadgets Store
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Cadastre-se</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="#">Olá, <c:out value="${username }"></c:out></a></li>
						<li><a href="Controller?page=logout" style="color: #F24638;">Sair</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Carrinho (<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>

	<div class="signup-header">
	 	<h2>Login em <mark>Gadgets Store</mark></h2>
	</div>

	 <form method="post" action="Controller">
	 
	 	<input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validacao de erros -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Nome de Usuário</label>
	 		<input type="text" name="username" placeholder="Nome de usuário" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Senha</label>
	 		<input type="password" name="senha" placeholder="Entre com a senha">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Entrar</button>
	 	</div>
	 	<p>
	 		Novo(a) em Gadgets Store? <a href="Controller?page=sign-up" style="color:#F24638;">Cadastre-se</a>
	 	</p>
	 </form>
	<br><br><br>
	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
	
</body>
</html>