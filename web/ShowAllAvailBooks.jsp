<%-- 
    Document   : ShowAllAvailBooks
    Created on : Apr 13, 2019, 10:06:50 AM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.AddBookEnt"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
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
        <title>Show All Avaliable Books</title>
        <style>
            .main{
            display: flex;
        }
        .left{
            flex:0.7;
            border-right:1px solid lightgrey;
            text-align: center;
            height: auto;
            min-height: 500px;
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
                cf.configure("Cfg/AddBook.cfg.xml");
                SessionFactory sf=cf.buildSessionFactory();
                Session s =sf.openSession();
                Transaction tx=s.beginTransaction();
                Query q=s.createQuery("from AddBookEnt");
                List<AddBookEnt> sa=q.list();
                out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:18px}</style>");
                    out.print("<center><h4 style='color:#c60d0d'>All Avaliable Books</h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>Book Title</th><th>Book Type</th><th>Isbn</th>");
                    out.println("<th>Copies Avaliable</th><th>Total Copies</th>");                         
                for (AddBookEnt ib : sa){
                    out.print("<tr>");
                    out.print("<td>"+ib.getBookTitle()+"</td>");
                    out.print("<td>"+ib.getBookType()+"</td>");
                    out.print("<td>"+ib.getIsbn()+"</td>");
                    out.print("<td>"+ib.getCopiesAvailable()+"</td>");
                    out.print("<td>"+ib.getNoOfCopies()+"</td>");
                    out.print("</tr>");
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
