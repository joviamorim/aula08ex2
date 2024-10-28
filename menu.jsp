<html>
    <body>
    <h2>Menu</h2>
        <ul>
            <li><a href="formcadastro.jsp">Cadastrar Contato</a></li>
            <li><a href="formcadastrologin.jsp">Cadastrar Login</a></li>
            <li><a href="formbusca.jsp">Buscar Contato pelo nome</a></li>
            <li><a href="formbuscames.jsp">Buscar Contato pelo mes de aniversario</a></li>
            <li><a href="formexclui.jsp">Excluir contato</a></li>
            <li><a href="sair.jsp">Sair</a></li>
        </ul>
    </body>
</html>

<%@ page import="javax.servlet.http.HttpSession" %>
<%
    if (session == null) {
        response.sendRedirect("formlogin.jsp");
        return;
    }
%>