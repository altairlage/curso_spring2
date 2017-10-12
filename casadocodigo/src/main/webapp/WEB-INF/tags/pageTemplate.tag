<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false"%>


<title>${titulo } - Casa do Codigo</title>

<body class="${bodyClass}">

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody></jsp:doBody>

<%@include file="/WEB-INF/views/rodape.jsp" %>
</body>