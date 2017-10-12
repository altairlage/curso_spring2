<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib  uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

	<div class="container">

		<h1>Cadastro de produto</h1>

		<form:form action="${s:mvcUrl('PC#gravar').build() }" method="POST" 
			commandName="produto" enctype="multipart/form-data" cssClass="form">
			<div class="form-group">
				<label>Titulo</label>
				<form:input path="titulo" cssClass="form-control"/>
				<form:errors path="titulo"/>
			</div>
			<div class="form-group">
				<label>Descrição</label>
				<form:textarea path="descricao" cssClass="form-control"/>
				<form:errors path="descricao"/>
			</div>
			<div class="form-group">
				<label>Paginas</label>
				<form:input path="paginas" cssClass="form-control"/>
				<form:errors path="paginas"/>
			</div>
			<div  class="form-group">
				<label>Data de lançamento</label>
				<form:input path="dataLancamento" cssClass="form-control"/>
				<form:errors path="dataLancamento"></form:errors>
			</div>
			<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>${tipoPreco}</label>
					<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
					<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
				</div>
			</c:forEach>
			<div class="form-group">
				<label>Sumário</label>
				<input name="sumario" type="file" class="form-control">
			</div>
			<button type=submit class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
	
	
	
<%@include file="/WEB-INF/views/rodape.jsp" %>