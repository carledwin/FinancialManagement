
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

<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />"
	rel="stylesheet" type="text/css" />
	
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
	
			<div>
				<input type="hidden" value="${id}" name="id">
				<input type="text" class="form-control" name="descricao" placeholder="Mês" required style="width:200px;">
			</div>
		<br>
	
	<!-- PANEL DESPESAS FIXAS -->
	
	<div class="panel panel-default">
		<div class="panel panel-heading" style="height:40px; font-weight:bold"><h3">Despesas Fixas</h3></div>
  		<div class="panel-body">
			<button class="btn btn-info" data-toggle="modal" data-target="#largeModal">+ Despesa Fixa</button>
			<br><br>
				<table class="table table-hover table-condensed table-striped table-bordered">
						<thead>
							<tr>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 350px">Conta Fixa</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 120px">R$</td>
								<td style="font-weight: bold; font-size: 15px; text-align: center; width: 180px">Data de Vencimento</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 200px">Status</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 150px">Ações</td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="despesa" items="${listaDespesasFixas}">
							<tr>
								<td style="font-size: 15px; text-align: center">${despesa.descricao}</td>
								<td style="font-size: 15px; text-align: center"><fmt:formatNumber value="${despesa.valor}"></fmt:formatNumber></td>
								<td style="font-size: 15px; text-align: center"><fmt:formatDate pattern="dd/MM/yyyy" value="${despesa.dataVencimento.time}"/> </td>
								<td style="font-size: 15px; text-align: center">${despesa.status.descricao}</td>
								<td style="font-size: 15px; text-align: center">Ações</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
		</div>
  		<div class="panel-footer" style="height: 40px;">
  		<table>
					<tbody>
							<tr>
								<td style="font-size: 15px; text-align: right; font-weight:bold; width: 350px">Soma: </td>
								<td style="font-size: 15px; text-align: right; width: 120px">${totalSomaFixa}</td>
								<td style="font-size: 15px; text-align: right; font-weight:bold; width: 180px">Pago: </td>
								<td style="font-size: 15px; text-align: right; width: 200px">${totalPago}</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: right; width: 100px">Total: </td>
								<td	style="font-weight: bold; font-size: 15px; text-align: right; width: 100px">${totalFinal}</td>
							</tr>
					</tbody>
			</table>
  		</div>
	</div>
	
	
		
	<br />
	
	<!-- PANEL DESPESAS VARIAVEIS -->
	
	<div class="panel panel-default">
		<div class="panel panel-heading" style="height:40px; font-weight:bold"><h3">Despesas Variáveis</h3></div>
  		<div class="panel-body">
			<button class="btn btn-info" data-toggle="modal" data-target="#largeModal">+ Despesa Variável</button>
			<br><br>
				<table class="table table-hover table-condensed table-striped table-bordered">
						<thead>
							<tr>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 350px">Conta Fixa</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 120px">R$</td>
								<td style="font-weight: bold; font-size: 15px; text-align: center; width: 180px">Data de Vencimento</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 200px">Status</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: center; width: 150px">Ações</td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="despesa" items="${listaDespesasVariaveis}">
							<tr>
								<td style="font-size: 15px; text-align: center">${despesa.descricao}</td>
								<td style="font-size: 15px; text-align: center"><fmt:formatNumber value="${despesa.valor}"></fmt:formatNumber></td>
								<td style="font-size: 15px; text-align: center"><fmt:formatDate value="${despesa.dataVencimento.time}"/> </td>
								<td style="font-size: 15px; text-align: center">${despesa.status.descricao}</td>
								<td style="font-size: 15px; text-align: center">Ações</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
		</div>
  		<div class="panel-footer" style="height: 40px;">
  		<table>
					<tbody>
							<tr>
								<td style="font-size: 15px; text-align: right; font-weight:bold; width: 350px">Soma: </td>
								<td style="font-size: 15px; text-align: right; width: 120px">${totalSomaFixa}</td>
								<td style="font-size: 15px; text-align: right; font-weight:bold; width: 180px">Pago: </td>
								<td style="font-size: 15px; text-align: right; width: 200px">${totalPago}</td>
								<td	style="font-weight: bold; font-size: 15px; text-align: right; width: 100px">Total: </td>
								<td	style="font-weight: bold; font-size: 15px; text-align: right; width: 100px">${totalFinal}</td>
							</tr>
					</tbody>
			</table>
  		</div>
	</div>
	
	 <div class = "form-group">
      <label for = "comentarios">Comentários</label>
      <textarea class = "form-control" name="comentarios" rows="3" placeholder="Comentários...."></textarea>
   </div>
   
		
		<br>
		<div align="right">
			<a href="${path }/despesa" ><button type="button" class="btn btn-default" data-dismiss="modal" align="right">Cancel</button></a>
             <button type="submit" class="btn btn-primary">Cadastrar</button>
		</div>
</section>



 <div class="bs">
    
    <div id="largeModal" class="modal fade bs-modal" tabindex="-1" role="dialog">
			<form action="despesa/cadastrar" method="POST" data-toggle="validator" >
        <div class="modal-dialog" style="width:500px;">
            <div class="modal-content">
                <div class="modal-header">
                   
                    <h4 class="modal-title">Cadastro de Despesa</h4>
                </div>
                <div class="modal-body">
           
		<div class="jumbotron" style="background-color: #FEFEFE;" >
			
			
					<div class="form-group col-sm-12">
						<input type="hidden" value="${id}" name="id">
						<label for="descricao" class="control-label">Despesa </label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Despesa" required style="width:380;">
					</div>

					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Valor </label> 
						<input type="text" class="form-control" id="valor" name="valor" placeholder="0,00" style="width:100px;">
					</div>

					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Vencimento </label> 
						<input type="date" class="form-control" name="dataVencimento" placeholder="  /    /    "  style="width:180px;">
					</div>
					
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Agendamento </label> 
						<input type="date" class="form-control" name="dataAgendamento" placeholder="  /    /    " style="width:180px;">
					</div>
					
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Pagamento </label> 
						<input type="date" class="form-control"  name="dataPagamento" placeholder="  /    /    " min="2000-01-02" max="2016-03-06" style="width:180px;">
					</div>
					
					<div class="form-group col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<label for="status" class="control-label">Status </label>
							</div>
							<div class="panel-body">
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "EM_ABERTO" checked> Em Aberto
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "PAGO"> Pago
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "VENCIDO"> Vencido
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "CANCELADO">Cancelado
								   </label>
								</div>
							</div>
						</div>
						<div class="help-block with-errors"></div>
					</div>
					
					
					<div class="form-group col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<label for="status" class="control-label">Tipo </label>
							</div>
							<div class="panel-body">
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "tipo" value = "FIXA"> Fixa
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "tipo" value = "VARIAVEL" checked> Variável
								   </label>
								</div>
							</div>
						</div>
						<div class="help-block with-errors"></div>
					</div>
					
			
		</div>
                   
                </div>
                <div class="modal-footer">
                    <a href="${path }/despesa" ><button type="button" class="btn btn-default" data-dismiss="modal" align="right">Cancel</button></a>
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                </div>
            </div>
        </div>
		</form>
    </div>
     
   
</div>


	<script type="text/javascript"		src="${path}/resources/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"		src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>

