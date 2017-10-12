<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

<body class="produto">
	<h1>${produto.titulo }</h1>
	
	<article id="${produto.id }">
		<h2>${produto.titulo }</h2>
		<p>${produto.descricao }</p>
	</article>
	
	<form:form servletRelativeAction="/carrinho/add" method="post" cssClass="container">
		<ul>
			<input type="hidden" value="${produto.id }" name="produtoId"> 
			<c:forEach items="${produto.precos }" var="preco">
				<li>
					<input type="radio" name="tipoPreco" id="tipo" value="${preco.tipo }">
					<label>${preco.tipo }</label>
					<p>${preco.valor }</p>
				</li>
			</c:forEach>
		</ul>
		
		<button type="submit" title="Compre agora'${produto.titulo }'!">Comprar</button>
	</form:form>
	
	<section>
		<h2>Dados do livro:</h2>
		<p>Numero de páginas: <span >${produto.paginas }</span></p>
		<p>Data de publicação: <span ><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time }"/></span></p>
	</section>
	
	
	
<%@include file="/WEB-INF/views/rodape.jsp" %>