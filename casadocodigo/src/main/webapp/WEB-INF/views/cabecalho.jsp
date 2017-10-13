    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="s"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Altair - Casa do codigo</title>
	
	<c:url value="/resources/css" var="cssPath"/>
	<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">
	<!-- <script src="resources/js/bootstrap.min.js"></script> -->
	
	<!-- 
	<style type="text/css">
        body{
            padding-top: 60px;
        }
    </style>
     -->
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Casa do Código</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="${s:mvcUrl('PC#listar').build() }">Lista de Produtos</a></li>
	      	<!--  <security:authorize access="hasRole('ROLE_ADMIN')"> -->
	        <li><a href="${s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a></li>
			<!-- </security:authorize>-->
	        <li>
	        	<a href="${s:mvcUrl('CCC#itens').build() }" rel="unfollow"> 
	        		<fmt:message key="menu.carrinho">
	        			<fmt:param value="${carrinhoCompras.quantidade }"/>
	        		</fmt:message>
	        		</a>
	        </li>
	        <li>
	        	<a href="?locale=en_US" rel="unfollow">
	        		<s:message code="menu.en"/>
	        	</a>
	        </li>
	        <li>
	        	<a href="?locale=pt" rel="unfollow">
	        		<s:message code="menu.pt"/>
	        	</a>
	        </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a href="#">
	      		<security:authentication property="principal" var="usuario"/>
	      		Usuario: ${usuario.username }
	      	</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>