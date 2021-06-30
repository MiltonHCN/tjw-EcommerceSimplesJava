<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<h1>
			Tela do Administrador
		</h1>
		<nav>
			<ul>
				<li><a href="AdminController?page=index-admin">Home</a></li>
				<li><a href="AdminController?page=addproduct">Add Produto</a></li>
				<li><a href="AdminController?page=logout" style="color: #F24638;">Sair</a></li>
			</ul>
		</nav>
	</header>
	
	 <sql:setDataSource user="root" password="qwe123" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/gadgets_store?useTimezone=true&serverTimezone=UTC" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from produto
		 
	   </sql:query>
	   
	<div class="container">
	<h2>Lista de Produtos</h2>
		 <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th style="width: 50px; text-align: center;">Item id</th>
			<th style="width: 100px; text-align: center;">Nome</th>
			<th style="width: 100px; text-align: center;">Preço</th>
			<th style="width: 100px; text-align: center;">Imagem</th>
			<th style="width: 100px; text-align: center;">Opções</th>
		</tr>
	</table>
		
		 <c:forEach items="${result.rows }" var="row">
		  <table style="table-layout: fixed;width: 100%;">
				<tr style="text-align: center;">
					<td style="width: 50px;"><c:out value="${row.id }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.nome }"></c:out></td>
					<td style="width: 100px;">R&#36; <c:out value="${row.valor }"></c:out>,00</td>
					<td style="width: 100px;"><img src="${row.imagem}" height="100" width="150" ></td>
					<td style="width: 100px;">
					<a href="<%= request.getContextPath() %>/AdminController?page=edit&id=${row.id}" style="color: #6bb1f8;">Edit</a> |
					<a href="<%= request.getContextPath() %>/AdminController?page=delete&id=${row.id}" style="color:#6bb1f8;">Delete</a>
					</td>
				</tr>
			</table>
		 </c:forEach>
		 </div>
	 <footer>
		<div class="footer">Copyright &copy; 2021 Milton</div>
	</footer>
	
</body>
</html>