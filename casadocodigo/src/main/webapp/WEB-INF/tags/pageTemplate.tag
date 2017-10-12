<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>


<title>${titulo } - Casa do Codigo</title>

<body class="${bodyClass}">

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody/>

<%@include file="/WEB-INF/views/rodape.jsp" %>

<jsp:invoke fragment="extraScripts"/>

 <!-- Aqui podem ficar os scripts a serem adicionados juntos com o template -->

</body>