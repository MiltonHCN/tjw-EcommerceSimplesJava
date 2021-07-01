<%@page import="beans.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Finalizar Compra</title>
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
						<li><a href="Controller?page=logout" style="color: #F24638;">Sair</a></li>
						<li><a href="#">Olá, <c:out value="${username }"></c:out></a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Carrinho (<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	
	<c:choose>
		<c:when test="${session == null}">
			<%
			JOptionPane.showMessageDialog(null, "Para realizar a compra você deve efetuar o login!", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			%>
		</c:when>
		
		<c:when test="${x == 0}">
			<%
			JOptionPane.showMessageDialog(null, "Seu carrinho está vazio!", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("carrinho.jsp").forward(request, response);
			%>
		</c:when>
		
		<c:when test="${session != null}">
			<div class="container" style="margin-top: 60px;margin-bottom: 60px;">
				<h4>Obrigado <font color="#6bb1f8"><c:out value="${name }"></c:out></font> por fazer compras conosco! Recebemos seu pedido e ele será entregue em <font color="#6bb1f8"><c:out value="${address }"></c:out></font> breve.</h4>					
				<br><br>
				<a href="Controller?page=index"><input type="button" value="Continue comprando" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
			</div>
		</c:when>
	</c:choose>

	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
	
</body>
</html>