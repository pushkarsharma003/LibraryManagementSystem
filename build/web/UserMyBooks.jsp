<%-- 
    Document   : UserMyBooks
    Created on : Apr 13, 2019, 9:43:30 PM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.IssueBookEnt"%>
<%@page import="LibFaculty.IssueBook"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Books</title>
        <style>
            
        </style>
    </head>
    <body>
        <% 
        if(session.getAttribute("username")==null && session.getAttribute("userid")==null){
            response.sendRedirect("UserLogin.jsp");
        }  
    %>
        <center>
        <div>
            <br><br>
            <%
                HttpSession hs=request.getSession();
                String uid=(String)hs.getAttribute("userid");
                Configuration cf=new Configuration();
                cf.configure("Cfg/IssueBook.cfg.xml");
                SessionFactory sf=cf.buildSessionFactory();
                Session s=sf.openSession();
                Transaction tx=s.beginTransaction();
                Query query=s.createQuery("from IssueBookEnt where userId='"+uid+"'");
                List<IssueBookEnt> ib=query.list();
                out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:10px}</style>");
                    out.print("<center><h4 style='color:#c60d0d'>My Issued Books</h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>Book Title</th><th>Issue Date</th><th>Isbn</th>");
                    out.println("<th>Due Date</th>");
                for (IssueBookEnt i : ib){
                    if(i.getUserId().equals(uid)){
                        out.print("<tr>");
                    out.print("<td>"+i.getBookTitle()+"</td>");
                    out.print("<td>"+i.getIssueDate()+"</td>");
                    out.print("<td>"+i.getIsbn()+"</td>");
                    out.print("<td>"+i.getDueDate()+"</td>");
                    out.print("</tr>");
                    }
                }
                out.println("</tr>");
                out.print("</center></table><br>");
                out.print("<b style='font-family: cursive;font-size:14px;'>Note : </b>");
                out.print("<a style='font-family: cursive;font-size:13px;color:dodgerblue'>You can issue only maximum of 3 books at one time</a>");
                tx.commit();
                sf.close();
            %>
        </div>
        </center>
    </body>
</html>
