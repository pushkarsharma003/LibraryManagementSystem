<%-- 
    Document   : UserMyFine
    Created on : Apr 13, 2019, 10:26:02 PM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.AddFineEnt"%>
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
        <title>My Fine</title>
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
                cf.configure("Cfg/FineAdd.cfg.xml");
                SessionFactory sf=cf.buildSessionFactory();
                Session s=sf.openSession();
                Transaction tx=s.beginTransaction();
                Query query=s.createQuery("from AddFineEnt where userId='"+uid+"'");
                List<AddFineEnt> ib=query.list();
                out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:10px}</style>");
                    out.print("<center><h4 style='color:#c60d0d'>My Pending Fine</h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>Returned Date</th><th>No of Fine Days</th><th>Fine(Rs.)</th>");
                    out.println("<th>Fine For Book</th>");
                    boolean datacheck = false;
                for (AddFineEnt i : ib){
                    if(i.getUserId().equals(uid)){
                        out.print("<tr>");
                    out.print("<td>"+i.getReturnDate()+"</td>");
                    out.print("<td>"+i.getNooffinedays()+"</td>");
                    out.print("<td>"+i.getFine()+"</td>");
                    out.print("<td>"+i.getFineForBook()+"</td>");
                    out.print("</tr>");
                    datacheck=true;
                    }
                }
                out.println("</tr>");
                out.print("</center></table><br>");
                if(!datacheck){
                    out.print("<a style='color:red;fonr-size:12px;'>*You have no pending fine</a><br><br>");
                }
                out.print("<b style='font-family: cursive;font-size:14px;'>Note : </b>");
                out.print("<a style='font-family: cursive;font-size:13px;color:dodgerblue'>Please contact with library to pay your pending fine</a>");
                out.print("<br><br><a href='UserFineHistory.jsp' style='color:#c60d0d' title='click to check paid fine history'>Paid Fine History</a>");
                tx.commit();
                sf.close();
                
            %>
        </div>
        </center>
    </body>
</html>
