<%-- 
    Document   : UserFineHistory
    Created on : Apr 14, 2019, 1:01:45 PM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.PaidFineEnt"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Paid Fine History</title>
    </head>
    <body>
        <% 
        if(session.getAttribute("username")==null && session.getAttribute("userid")==null){
            response.sendRedirect("UserLogin.jsp");
        }  
    %>
    <div>
        <br><br>
        <%
            HttpSession hs=request.getSession();
            String uid=(String)hs.getAttribute("userid");
            Configuration cf=new Configuration();
            cf.configure("Cfg/PaidFine.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session s=sf.openSession();
            Transaction tx=s.beginTransaction();
            Query query=s.createQuery("from PaidFineEnt where userId='"+uid+"'");
            List<PaidFineEnt> ib=query.list();
            out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:10px}</style>");
            out.print("<center><h4 style='color:#c60d0d'>My Paid Fine</h4></center>");
            out.println("<center><table>");
            out.println("<tr style='color:green'>");
            out.println("<th>Returned Date</th><th>No of Fine Days</th><th>Paid Fine(Rs.)</th>");
            out.println("<th>Fine For Book</th><th>Paid Fine On Date</th>");
            boolean datacheck = false;
            for (PaidFineEnt i : ib){
                if(i.getUserId().equals(uid)){
                    out.print("<tr>");
                    out.print("<td>"+i.getReturnDate()+"</td>");
                    out.print("<td>"+i.getNooffinedays()+"</td>");
                    out.print("<td>"+i.getPaidfine()+"</td>");
                    out.print("<td>"+i.getFineForBook()+"</td>");
                    out.print("<td>"+i.getPaidfinedate()+"</td>");
                    out.print("</tr>");
                    datacheck=true;
                }
            }
            out.println("</tr>");
            out.print("</center></table><br>");
            if(!datacheck){
                out.print("<a style='color:red;fonr-size:12px;'>*You have not paid any fine yet</a><br><br>");
            }
            out.print("<br><a href='UserMyFine.jsp' style='color:#c60d0d' title='click to go back'><c style='font-size:24px;'>&lsaquo;</c> Go back to Pay Fine</a>");
            tx.commit();
            sf.close();    
            %>
        </div>
    </body>
</html>
