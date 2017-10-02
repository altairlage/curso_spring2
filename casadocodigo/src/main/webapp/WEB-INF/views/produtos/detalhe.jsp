<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${produto.titulo } - Casa do codigo</title>
</head>
<body class="produto">
	<h1>${produto.titulo }</h1>
	<a href="/carrinho" rel="nofollow"> Se carrinho</a>
	
	<article id="${produto.id }">
		<h2>${produto.titulo }</h2>
		<p>${produto.descricao }</p>
	</article>
	
	<a href="/carrinho" rel="unfollow"> Seu carrinho (${carrinhoCompras.quantidade })</a>
	
	<form action='<c:url value="/carrinho/add"/>' method="post">
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
	</form>
	
	<section>
		<h2>Dados do livro:</h2>
		<p>Numero de páginas: <span >${produto.paginas }</span></p>
		<p>Data de publicação: <span ><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time }"/></span></p>
	</section>
	
</body>
</html>