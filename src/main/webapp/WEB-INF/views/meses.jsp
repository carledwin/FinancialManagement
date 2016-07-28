<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Meses</title>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<link	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"			rel="stylesheet" type="text/css" />
<link	href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />"	rel="stylesheet" type="text/css" />
<link 	href="<c:url value="/resources/css/fm.css" />" 								rel="stylesheet" type="text/css" />
	
</head>
<body>

	
	<!--############################################## NAVIGATION BAR ############################################################# -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Financial Management</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/mes/novo">Mês</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Consulta<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/mes">Mês</a></li>
        </ul>
      </li>
      <li><a href="#">Link</a></li> 
    </ul>
  </div>
</nav>


	<section class="container" style="width: 95%">
	<br />
		<div class="jumbotron" style="background-color: #FEFEFE">
			
				<h2 align="center">Meses</h2>

			<div class="jumbotron" style="background-color: #FEFEFE">
				
					
			 <!-- Large modal -->
			<a href="${path }/mes/novo"><button class="btn btn-info" >+ Novo Mês</button></a>
			<br>
			<br>
				<table
						class="table table-hover table-condensed table-striped table-bordered">
						<thead>
							<tr>
								<td	class="head-grid">Código</td>
								<td	class="head-grid">Mês</td>
								<td	class="head-grid">Qtde. Despesas</td>
								<td	class="head-grid">Valor Total a Pagar</td>
								<td class="head-grid">Valor Total Vencido</td>
								<td class="head-grid">Valor Total Pago</td>
								<td	class="head-grid">Data Inicial</td>
								<td	class="head-grid">Data Final</td>
								<td	class="head-grid" colspan="2">Controle</td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="mes" items="${listaMeses}">
							<tr>
								<td class="line-grid">${mes.id}</td>
								<td class="line-grid">${mes.descricao}</td>
								<td class="line-grid"></td>
								<td class="line-grid"><fmt:formatNumber value="${mes.valorTotalAPagar}"  type="currency"/> </td>
								<td class="line-grid"><fmt:formatNumber value="${mes.valorTotalPago}"  type="currency"/></td>
								<td class="line-grid"><fmt:setLocale value="pt_BR"/> <fmt:formatNumber value="${mes.valorTotalVencido}" type="currency"/></td>
								<td class="line-grid"><fmt:formatDate value="${mes.dataInicial}" pattern="dd/MM/yyyy" /></td>
								<td class="line-grid"><fmt:formatDate value="${mes.dataFinal}" pattern="dd/MM/yyyy" /> </td>
								<td>
									<form action="${path}/mes/delete/${mes.id}" method="POST">
										<button type=submit class="btn btn-danger" >
										  	Excluir
										</button>
									</form>
								</td>
								<td>
									<form action="${path}/mes/edit/${mes.id}" method="POST">
										<button type=submit class="btn btn-warning" >
										  	Editar
										</button>
									</form>
							</td>
							</c:forEach>
						</tbody>
					</table>
					
					
				</div>
			
			</div>
			
	

</section>

	<script type="text/javascript"		src="${path}/resources/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"		src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
