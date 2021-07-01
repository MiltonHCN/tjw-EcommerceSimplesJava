<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
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
	
	<div class="JavaEcommerce-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-8"><!-- right -->
 					<h2 style="text-align: center;">Produtos</h2><br>
 					<c:forEach items="${listaProdutos}" var="produto">
		 					<div class="col-md-4">
		 						<img src="${produto.getImagem() }" class="img-responsive" ><br>
		 						<div class="text-center"><a style="color: black; text-decoration: none;"><c:out value="${produto.getNome()}"></c:out></a></div>	
		 						<p style="text-align: center;"> R&#36;  <c:out value="${ produto.getValor() }"></c:out>,00</p>
		 						<div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&id=<c:out value="${produto.getId()}"/>">Adicionar ao carrinho</a> </div><br>
		 					</div>
 					</c:forEach>
 				</div>
 			</div>
 		</div>
 	</div>

	<footer>
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
</body>
</html>