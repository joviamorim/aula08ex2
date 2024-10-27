<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/contato","root","");
  PreparedStatement statement=conexao.prepareStatement("select * from amigos");
  ResultSet listar=statement.executeQuery();
  int reg=1;
  while(listar.next()){
	    out.println("<b>Registro: "+reg+"</b>");
		out.println(listar.getString("nome"));
		out.println(listar.getString("telefone"));
		out.println(listar.getString("email")+"<p>");
		reg++;
  }					
%>