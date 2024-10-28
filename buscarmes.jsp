<html>
    <br>
</html>
<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>
<%
  String mes=request.getParameter("mes");
  PreparedStatement statement=conexao.prepareStatement("select * from amigos where MONTH(datanasc) = ?");
  statement.setInt(1, Integer.parseInt(mes));
  ResultSet listar=statement.executeQuery();
  int reg=0;
  out.println("<br>");
  while(listar.next()){
		out.println(listar.getString("nome"));
		out.println(listar.getString("telefone"));
		out.println(listar.getString("email"));
		out.println(listar.getString("datanasc")+"<p>");
		reg++;
  }	
  out.println("<hr>Foram localizados " + reg + " registros.");  
%>