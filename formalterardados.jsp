<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>

<html>
	<% 
		String nome = "";
		String fone = "";
		String email = "";
		String dataNasc = "";
		String amigo=request.getParameter("amigoalterar");
		PreparedStatement statement2=conexao.prepareStatement("select * from amigos where nome=?");
		statement2.setString(1,amigo); 
		ResultSet verificar=statement2.executeQuery(); 
		if(verificar.next()){ 
			nome = verificar.getString("nome");
			fone = verificar.getString("telefone");
			email = verificar.getString("email");
			dataNasc = verificar.getString("dataNasc");
		}
		statement2.close(); 
	%>
  <form method='post' action=''>
	Nome: <input type='text' name='nome' value="<%= nome %>" readonly><p>
	Fone: <input type='text' name='fone' value="<%= fone %>"><p>
	E-mail: <input type='text' name='email' value="<%= email %>"><p>
	Data Nascimento: <input type='date' name='dataNasc' value="<%= dataNasc %>"><p>
	<input type='submit' value='Alterar'><br>
	<br/><a href="./menu.jsp">Voltar</a>
  </form>
</html>
<%
   	if (request.getMethod().equals("POST")) {
		nome = request.getParameter("nome");
		fone = request.getParameter("fone");
		email = request.getParameter("email");
		dataNasc = request.getParameter("dataNasc");
		PreparedStatement statement=conexao.prepareStatement("update amigos set telefone=?, email=?, dataNasc=? where nome=?");
		statement.setString(1,fone);
		statement.setString(2,email);
		statement.setString(3,dataNasc);
		statement.setString(4,nome);
		statement.executeUpdate();
 	}
%>