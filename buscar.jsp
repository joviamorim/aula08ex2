﻿<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>
<%
  String nome=request.getParameter("nome");
  PreparedStatement statement=conexao.prepareStatement("select * from amigos where nome like ?");
  statement.setString(1, "%" + nome + "%");
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