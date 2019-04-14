<%-- 
    Document   : ShowFine
    Created on : Apr 13, 2019, 11:28:38 AM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.AddFineEnt"%>
<%@page import="java.util.List"%>
<%@page import="LibFacultyEntity.IssueBookEnt"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Show Fine</title>
        <style>
            .mainDiv{
            
        }
        .main{
            display: flex;
        }
        .left{
            flex:0.7;
            border-right:1px solid lightgrey;
            text-align: center;
            min-height: 500px;
            height: auto;
        }
        .right{
            flex:3;
        }
        .leftNav
        {
            color:#c60d0d;        
        }
        </style>
    </head>
    <body>
         <% 
        if(session.getAttribute("LibFacLog")==null){
            response.sendRedirect("UserLogin.jsp");
        }
    %>
        <div class="main">
            <div class="left">
                <h2 style="font-family:cursive;">Main Menu</h2>
                <a href="ShowIssuedBooks.jsp" title="Click to show list" class="leftNav">Show All Issued Books</a>
                <br><br>
                <a href="ReturnBook.jsp" title="Click to return book" class="leftNav">Return Book</a>
                <br><br>
                <a href="ShowAllAvailBooks.jsp" title="Click to show list" class="leftNav">Show All Available Books</a>
                <br><br>
                <a href="ShowFine.jsp" title="Click to show list" class="leftNav">Show All Fine</a>
                <br><br>
                <a href="SearchUserById.jsp" title="Click to search" class="leftNav">Search User By Id</a>
                <br><br>
                <a href="ShowAllUsers.jsp" title="Click to show list" class="leftNav">Show All Users</a>
                <br><br>
                <a href="PayFine.jsp" title="Click to pay fine" class="leftNav">Pay Fine</a>
                <br><br>
                <a href="PaidFineHistory.jsp" title="Click to check history" class="leftNav">Paid Fine History</a>
            </div>
            <div class="right">
                <div class="mainDiv">
            <br>
            <%
                Configuration cf=new Configuration();
                cf.configure("Cfg/FineAdd.cfg.xml");
                SessionFactory sf=cf.buildSessionFactory();
                Session s =sf.openSession();
                Transaction tx=s.beginTransaction();
                Query q=s.createQuery("from AddFineEnt");
                List<AddFineEnt> sa=q.list();
                out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:18px}</style>");
                    out.print("<center><h4 style='color:#c60d0d'>All Unpaid Fine</h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>User Id</th><th>Return Date</th><th>No of Fine Days</th>");
                    out.println("<th>Fine(Rs.)</th><th>Fine For Book</th>");
                    boolean datafound=false;
                for (AddFineEnt ib : sa){
                    datafound=true;
                    out.print("<tr>");
                    out.print("<td>"+ib.getUserId()+"</td>");
                    out.print("<td>"+ib.getReturnDate()+"</td>");
                    out.print("<td>"+ib.getNooffinedays()+"</td>");
                    out.print("<td>"+ib.getFine()+"</td>");
                    out.print("<td>"+ib.getFineForBook()+"</td>");
                    out.print("</tr>");
                }
                if(datafound==false){
                    out.println("<br><p style='color:red;font-size:12px;'>*No Fine Avaliable</p>");
                }
                out.println("</tr>");
                out.print("</center></table>");
                tx.commit();
                sf.close();
            %>
        </div>
            </div>
        </div>
    </body>
</html>
