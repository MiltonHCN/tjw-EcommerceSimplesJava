<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar</title>
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
						<li><a href="Controller?page=sign-up">Cadaste-se</a></li>
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
	 	<h2>Cadastre-se em <mark>Gadgets Store</mark></h2>
	 </div>

	 <form method="post" action="Controller">
	 
	 	<input type="hidden" name="page" value="sign-up-form">
	 
	 	<!-- Validacao de erros -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 	
	 	<div class="signup-group">
	 		<label>Nome de Usuário</label>
	 		<input type="text" name="username" placeholder="Nome de usuário" value="<c:out value="${username }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Senha</label>
	 		<input type="password" name="senha_1" placeholder="Entre com a senha" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Confirme a senha</label>
	 		<input type="password" name="confirmacao_senha_1" placeholder="Confirme a senha" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<button type="submit" name="register" class="signup-btn">Cadastrar</button>
	 	</div>
	 	<p>
	 		Já é Cadastrado? <a href="Controller?page=login" style="color:#F24638;">Entrar!</a>
	 	</p>
	 </form>
	<br><br><br>
	<footer>
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
	
</body>
</html>