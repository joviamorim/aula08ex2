<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>
<html>
  <form method='post' action='formalterardados.jsp'>
		Nome: <select name='amigoalterar'>
	  	<%
			PreparedStatement statement=conexao.prepareStatement("select * from amigos");
			int lin=0;
			ResultSet listar=statement.executeQuery();
			out.print("<option value='' selected>Escolha o contato para alterar </option>");
			while(listar.next()){
				out.println("<option value='"+listar.getString("nome")+"'>"+listar.getString("nome")+"</option>");	
				lin++;
			}					
	 	%>
	  	</select>
	  	<%if(lin!=0){
			out.println("<input type='submit' value='Buscar'>");
	  	}%>
	  	<input type='button' value='Voltar' onclick="parent.location.href='formcadastro.jsp'"><p>
	  	<br/><a href="./menu.jsp">Voltar</a>
  </form>
</html>