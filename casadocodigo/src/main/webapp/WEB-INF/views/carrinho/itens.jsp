<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="${s:mvcUrl('CCC#itens').build() }">Carrinho de compras - QTD (${carrinhoCompras.quantidade })</a>
	<table>
		<tr>
			<td>Item</td>
			<td>Preço</td>
			<td>Quantidade</td>
			<td>Total</td>
			<td>Ações</td>
		</tr>
		<c:forEach items="${carrinhoCompras.itens}" var="item">
			<tr>
				<td>${item.produto.titulo }</td>
				<td>${item.preco}</td>
				<td><input type="number" min="0" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }"> </td>
				<td>${carrinhoCompras.getTotal(item)}</td>
				<td>
					<form action="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).arg(1, item.tipoPreco).build() }" method="post">
						<input type="submit" name="remover" value="remover" />
					</form>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>${carrinhoCompras.total }</td>
		</tr>
		<tr>
			<td>
				<form action="${s:mvcUrl('PC#finalizar').build()}" method="post">
					<input type="submit" class="checkout" name="checkout" value="Finalizar compra" />
				</form>
			</td>
		</tr>
	</table>
</body>
</html>