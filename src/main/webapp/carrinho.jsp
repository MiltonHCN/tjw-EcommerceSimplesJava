<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrinho</title>
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
	
	<div class="container">
	
	<c:choose> 
		<c:when test="${x == 1}">
						<h4 style="margin-top: 40px;">Meu carrinho (<c:out value="${x}"/> item)</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 style="margin-top: 40px;">Meu carrinho (<c:out value="${x}"/> items)</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;">Seu carrinho está vazio!</h4>
		</c:otherwise>
	</c:choose>
	
	<table style="table-layout: fixed;width: 100%;">
		<tr>
			<th style="width: 100px; text-align: center;">Item</th>
			<th style="width: 50px; text-align: center;">Valor</th>
			<th style="width: 100px; text-align: center;">Remover Item</th>
		</tr>
	</table>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${listaCarrinho }" var="i">
			<c:forEach items="${listaProdutos }" var="produto">
				<c:if test="${i == produto.getId() }">
				
				<c:set var="total" value="${total + produto.getValor() }"></c:set>
				
			<table style="table-layout: fixed;width: 100%;">
				<tr>
					<td style="width: 100px;"><img src="${produto.getImagem()}" height="100" width="150" > <c:out value="${produto.getNome()}"/></td>
					<td style="width: 50px; text-align: center;">R&#36; <c:out value="${produto.getValor()}"/>,00</td>
					<td style="width: 100px; text-align: center;"><a href="Controller?page=remove&id=<c:out value="${produto.getId()}"/>"><span class="btn btn-danger">X</span></a></td>
				</tr>
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Valor Total: R&#36; <c:out value="${ total}"></c:out>,00</h4>	
		
	<c:choose>
		<c:when test="${session == null}">
			<a href="Controller?page=finalizarCompra_1"><input type="button" value="Efetuar compra" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br><br>		
		</c:when>
		<c:when test="${session != null}">
			<a href="Controller?page=finalizarCompra_2"><input type="button" value="Efetuar compra" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br><br>
		</c:when>
	</c:choose>	
	
	<a href="Controller?page=index"><input type="button" value="Continue comprando" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>			
	
	</div>

	<footer style="margin-top: 40px;">
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
	
</body>
</html>