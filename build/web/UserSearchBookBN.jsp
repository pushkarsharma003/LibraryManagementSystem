<%-- 
    Document   : UserSearchBookBN
    Created on : Apr 13, 2019, 11:01:12 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String booktitle=request.getParameter("booktitle");
    HttpSession h=request.getSession();
    h.setAttribute("SearchBookTitle",booktitle);
    response.sendRedirect("UserHome.jsp");
%>