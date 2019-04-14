<%-- 
    Document   : PaidFineHistory
    Created on : Apr 13, 2019, 8:57:41 PM
    Author     : PushkarSharma
--%>

<%@page import="LibFacultyEntity.PaidFineEnt"%>
<%@page import="LibFacultyEntity.AddUserEnt"%>
<%@page import="java.util.List"%>
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
        <title>Paid Fine History</title>
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
        .SearchByIdForm{
            border:1px solid lightgray;
            height:180px;
            width:500px;
            border-radius: 10px;
        }
        .input{
                height:40px;
                width:300px;
                border-radius :5px;
                border:1px solid #E5E7E9;
                background-color: #E5E7E9;
                box-sizing: border-box;
            }
            .input:focus{
                border:2px solid lightblue;
                background-color: white;
                box-sizing: border-box;
                box-shadow: 0px 0px 10px dodgerblue;
            }
            .SearchBtn{
                background-color: dodgerblue;
                border: none;
                padding: 14px 30px;
                color:white;
                font-family: cursive;
                border-radius: 10px;
                cursor: pointer;
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
                cf.configure("Cfg/PaidFine.cfg.xml");
                SessionFactory sf=cf.buildSessionFactory();
                Session s =sf.openSession();
                Transaction tx=s.beginTransaction();
                Query q=s.createQuery("from PaidFineEnt");
                List<PaidFineEnt> sa=q.list();
                out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:6px}</style>");
                    out.print("<center><h4 style='color:#c60d0d'>All Paid Fine</h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>User Id</th><th>Return Date</th><th>No of Fine Days</th>");
                    out.println("<th>Paid Fine</th><th>Fine For Book</th>");
                    out.println("<th>Paid Fine Date</th>");
                for (PaidFineEnt ib : sa){
                    out.print("<tr>");
                    out.print("<td>"+ib.getUserId()+"</td>");
                    out.print("<td>"+ib.getReturnDate()+"</td>");
                    out.print("<td>"+ib.getNooffinedays()+"</td>");
                    out.print("<td>"+ib.getPaidfine()+"</td>");
                    out.print("<td>"+ib.getFineForBook()+"</td>");
                    out.print("<td>"+ib.getPaidfinedate()+"</td>");
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
