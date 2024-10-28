<%@ page import="java.sql.*" %>
<%@include file="conectar.jsp" %>
<%
  String email=request.getParameter("email");
  String senha=request.getParameter("senha");
  PreparedStatement statement=conexao.prepareStatement("select email, senha from login where email like ?");
  statement.setString(1, "%" + email + "%");
  ResultSet listar=statement.executeQuery();
  listar.next();

  if (senha.equals(listar.getString("senha"))) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);

            Integer vezes = (Integer) session.getAttribute("vezes");
            if (vezes == null) {
                vezes = 1;
            } else {
                vezes++;
            }
            session.setAttribute("vezes", vezes);

            response.sendRedirect("menu.jsp");
        } else {
            out.println("Login incorreto");
        }
%>
