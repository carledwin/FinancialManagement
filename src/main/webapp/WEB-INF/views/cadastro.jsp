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
<title>Receba promoções e novidades</title>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<section class="container">
	<div class="bs-example">
    <!-- Large modal -->
	<button class="btn btn-primary" data-toggle="modal" data-target="#largeModal">Large modal</button>
 
    <div id="largeModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                   
                    <h4 class="modal-title">Large Modal</h4>
                </div>
                <div class="modal-body">
           
		<div class="jumbotron" style="background-color: #FEFEFE; width:500px;">
			<div class="container ">
				<h2 align="center">Cadastro de Despesa</h2>
				<form action="finalizarVotacao" method="POST" data-toggle="validator" role="form">
					<div class="form-group col-sm-9">
						<input type="hidden" value="${idDespesa}" name="id">
						<label for="descricao" class="control-label">Despesa </label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Despesa" required style="width:400px;">
					</div>

					<div class="form-group col-sm-3">
						<label for="valor" class="control-label">Valor </label> 
						<input type="text" class="form-control" id="valor" name="valor" placeholder="0,00" required style="width:100px;">
					</div>

					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Vencimento </label> 
						<input type="text" class="form-control" id="valor" name="valor" placeholder="01/01/2016" required style="width:100px;">
					</div>
					
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Agendamento </label> 
						<input type="text" class="form-control" id="valor" name="valor" placeholder="  /    /    " style="width:100px;">
					</div>
					
					<div class="form-group col-sm-6">
						<label for="valor" class="control-label">Data de Pagamento </label> 
						<input type="text" class="form-control" id="valor" name="valor" placeholder="  /    /    " style="width:100px;">
					</div>
					
					<div class="form-group col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<label for="status" class="control-label">Status </label>
							</div>
							<div class="panel-body">
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "status.codigo" checked> Em Aberto
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "status.codigo"> Pago
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "status.codigo"> Vencido
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "status" value = "status.codigo">Cancelado
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
								      <input type = "radio" name = "tipo" value = "tipo.codigo"> Fixa
								   </label>
								</div>
								<div class = "radio">
								   <label>
								      <input type = "radio" name = "tipo" value = "tipo.codigo" checked> Variável
								   </label>
								</div>
							</div>
						</div>
						<div class="help-block with-errors"></div>
					</div>
					
					<div class="form-group col-sm-12" align="right">
						<a href="${path }/despesa"><button type="button" class="btn btn-default">Cancelar</button></a>
						<button type="submit" class="btn btn-info">Cadastrar</button>
					</div>
				</form>
			</div>
		</div>
                   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">OK</button>
                </div>
            </div>
        </div>
    </div>
     
   
</div>
	</section>
	<script type="text/javascript"
		src="${path}/resources/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
