<html>
	<body>
		<a href="menu.jsp">Voltar ao menu</a>
	</body>
</html>
<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/contato","root","");
%>