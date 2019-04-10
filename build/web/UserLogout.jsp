<%-- 
    Document   : UserLogout
    Created on : Apr 7, 2019, 7:53:02 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession as=request.getSession();
    as.removeAttribute("username");
    as.removeAttribute("userid");
    as.invalidate();
    response.sendRedirect("UserLogin.jsp");
%>
