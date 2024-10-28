<%@ page import="javax.servlet.http.HttpSession" %>
<%
if (session != null) {
            request.getSession().removeAttribute("email");
            session.invalidate();
        }
        response.sendRedirect("formlogin.jsp");
%>