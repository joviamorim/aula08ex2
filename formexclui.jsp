<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>
<script>
  function alerta(){
    alert("Contato exclu�do!");
  }
</script>
<html>
  <form method='post' action=''>
      Nome: <select name='amigoexcluir'>
	  <%
		PreparedStatement statement=conexao.prepareStatement("select * from amigos");
		int lin=0;
		ResultSet listar=statement.executeQuery();
		out.print("<option value='' selected>Escolha o contato para exclus�o </option>");
		while(listar.next()){
			out.println("<option value='"+listar.getString("nome")+"'>"+listar.getString("nome")+"</option>");	
			lin++;
        }					
	 %>
	  </select>
	  <%if(lin!=0){
		out.println("<input type='submit' value='Excluir' onclick='alerta()'>");
	  }%>
	  <input type='button' value='Voltar' onclick="parent.location.href='formcadastro.jsp'">
  </form>
</html>
<%
   if (request.getMethod().equals("POST")) {
	if(lin==0)
		out.println("N�o h� contatos cadastrados!<p>");
	else{
		String confirma=request.getParameter("con"); 
		String amigo=request.getParameter("amigoexcluir");	
		PreparedStatement statement2=conexao.prepareStatement("delete from amigos where nome=?");
		statement2.setString(1,amigo);
		statement2.execute();
		response.setIntHeader("Refresh", 2);
	}
  }
%>