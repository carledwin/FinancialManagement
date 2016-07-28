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
<title>Despesas</title>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" 		rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/fm.css" />" rel="stylesheet" type="text/css" />
	
<style type="text/css">
    .bs{
    	margin: 20px;
    }
</style>
</head>
<body>

	<!-- NAVIGATION BAR -->
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
          <li><a href="${path}/despesa/nova">Despesa</a></li>
          <li><a href="${path}/mes/novo">Mês</a></li>
          <li><a href="${path}/tipoDespesa/nova">Tipo de Despesa</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Consulta<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/despesa">Despesa</a></li>
          <li><a href="${path}/mes">Mês</a></li>
          <li><a href="${path}/tipoDespesa">Tipo de Despesa</a></li>
        </ul>
      </li>
      <li><a href="#">Link</a></li> 
    </ul>
  </div>
</nav>





	<section class="container">
	<br />
		<div class="jumbotron" style="background-color: #FEFEFE">
			<div class="container">
				<h2 align="center">Despesas Fixas</h2>

			<div class="jumbotron" style="background-color: #FEFEFE">
				<div class="container">
					
			 <!-- Large modal -->
			<button class="btn btn-info" data-toggle="modal" data-target="#largeModal">+ Despesa Fixa</button>
			<br>
			<br>
				<table
						class="table table-hover table-condensed table-striped table-bordered">
						<thead>
							<tr>
								<td	class="head-grid">Despesa</td>
								<td	class="head-grid">Tipo</td>
								<td	class="head-grid">Valor</td>
								<td class="head-grid">Status</td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="despesaF" items="${listaDespesasFixas}">
							<tr>
								<td class="line-grid">${despesaF.descricaoD}</td>
								<td class="line-grid">${despesaF.tipo.descricao}</td>
								<td class="line-grid">${despesaF.valor}</td>
								<td class="line-grid">${despesaF.status.descricao}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
				</div>
			</div>
			</div>
			</div>
	

</section>



 <div class="bs">
    
    <div id="largeModal" class="modal fade bs-modal" tabindex="-1" role="dialog">
			
			  <div class="modal-dialog" style="width:500px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Cadastro de Despesa</h4>
                </div>
                <div class="modal-body">
           
           <div class="form-group col-sm-12">
			<div class="panel panel-default">
					<div class="panel-body">
							<form action="${path }/despesa/cadastrar" method="POST" data-toggle="validator" >
								<div class="form-group col-sm-12">
						<input type="hidden" value="${novaDespesa.id}" name="id">
						<label for="descricao" class="control-label">Despesa </label> 
						<input type="text" class="form-control hinput" id="descricao" name="descricaoD" value="${novaDespesa.descricaoD }" placeholder="Despesa" required >
						</div>
						
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Valor </label> 
						<input type="text" class="form-control hinput" id="valor" name="valor"  value='<fmt:formatNumber value="${novaDespesa.valor}" ></fmt:formatNumber>' placeholder="0,00" style="width:100px;">
					</div>
  
				 	<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Vencimento </label> 
						<input type="text" class="form-control hinput" maxlength="10" name="dataVencimento" value='<fmt:formatDate value="${novaDespesa.dataVencimento}" pattern="dd/MM/yyyy"/>' placeholder="  /    /    "  style="width:180px;">
					</div>

					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Agendamento </label> 
						<input type="text" class="form-control hinput" maxlength="10" name="dataAgendamento" value='<fmt:formatDate value="${novaDespesa.dataAgendamento}" pattern="dd/MM/yyyy"/>' placeholder="  /    /    " style="width:180px;">
					</div>
					
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Pagamento </label> 
						<input type="text" class="form-control hinput" maxlength="10"  name="dataPagamento" value='<fmt:formatDate value="${novaDespesa.dataPagamento}" pattern="dd/MM/yyyy" />' placeholder="  /    /    "  style="width:180px;">
					</div> 
 						
						  	<div class="form-group col-sm-6">
							<div class="panel panel-default">
									<div class="panel-heading">
										<label for="status" class="control-label">Status </label>
									</div>
									<div class="panel-body" style="height: 130px">
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "status" value = "EM_ABERTO" checked> Em Aberto
										   </label>
										</div>
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "status" value = "PAGA"> Paga
										   </label>
										</div>
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "status" value = "VENCIDA"> Vencida
										   </label>
										</div>
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "status" value = "CANCELADA">Cancelada
										   </label>
										</div>
									</div>
							</div>
						</div>
							<div class="form-group col-sm-6">
							<div class="panel panel-default">
									<div class="panel-heading">
										<label for="tipo" class="control-label">Tipo </label>
									</div>
									<div class="panel-body" style="height: 130px">
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "tipo" value = "FIXA" checked> Fixa
										   </label>
										</div>
										<div class = "radio">
										   <label>
										      <input type = "radio" name = "tipo" value = "VARIAVEL"> Variável
										   </label>
										</div>
									</div>
							</div>
						</div>
									
					<hr>
							<div class="form-group col-sm-12" style="text-align: right;">
						          <a href="${path }/despesa" ><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button></a>
						       <button type="submit" class="btn btn-primary">Adicionar</button>
						   </div>
						</form>
					</div>
			</div>
		</div>
		
                   
                </div>
                <div class="modal-footer">
    
                </div>
            </div>
        </div>
							
    </div>
     
   
</div>


	<script type="text/javascript"		src="${path}/resources/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"		src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
