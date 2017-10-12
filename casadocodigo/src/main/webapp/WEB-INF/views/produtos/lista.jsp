<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib  uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

	<div class="container">
		<h1>Lista de produtos</h1>
		<div>${sucesso }</div>
		<div>${falha }</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Titulo</th>
				<th>Descrição</th>
				<th>Paginas</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build() }">${produto.titulo}</a></td>
					<td>${produto.descricao}</td>
					<td>${produto.paginas}</td>
				</tr>
			
			</c:forEach>
		</table>
	</div>
	
	

<%@include file="/WEB-INF/views/rodape.jsp" %>