<%-- 
    Document   : SearchUserById
    Created on : Apr 13, 2019, 3:33:39 PM
    Author     : PushkarSharma
--%>

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
        <title>Search User By Id </title>
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
                <br>
                <center><h4 style="color:#c60d0d">Search User By Id</h4></center>
                <center>
                    <div class="SearchByIdForm">
                        <br><br>
                        <form action="SearchById">    
                        <input type="text" placeholder="Enter Id to Search" class="input" name="useridtosearch"><br><br>
                        <input type="submit" value="Search" class="SearchBtn" title="click to search">
                    </form>
                </div>
                </center>
                <br><br>
                <div>
                    <%
                        HttpSession hs=request.getSession();
                        String userid=(String)hs.getAttribute("UserIdToSearch");
                        Configuration cf=new Configuration();
                        cf.configure("Cfg/AddUser.cfg.xml");
                        SessionFactory sf=cf.buildSessionFactory();
                        Session s=sf.openSession();
                        Transaction tx=s.beginTransaction();
                        Query query=s.createQuery("from AddUserEnt where userId='"+userid+"'");
                        List<AddUserEnt> ad=query.list();
                        for (AddUserEnt e : ad){
                            out.print("<center>");
                            out.print("<div style='border:1px solid #c60d0d;border-radius:10px;height:200px;width:550px;'>");
                            out.print("<br><br>");
                            out.print("<b style='color:#c60d0d'>User Id : </b>"+e.getUserid()+"<br>");
                            out.print("<b style='color:#c60d0d'>User Name : </b>"+e.getUsername()+"<br>");
                            out.print("<b style='color:#c60d0d'>Batch : </b>"+e.getBatch()+"<br>");
                            out.print("<b style='color:#c60d0d'>Father's Name : </b>"+e.getFathername()+"<br>");
                            out.print("<b style='color:#c60d0d'>Mother's Name : </b>"+e.getMothername()+"<br>");
                            out.print("<b style='color:#c60d0d'>Email : </b>"+e.getEmail()+"<br>");
                            out.print("<b style='color:#c60d0d'>Mobile Number : </b>"+e.getMobileno()+"<br>");
                            out.print("</div>");
                            out.print("</center>");
                        }
                        tx.commit();
                        sf.close();
                        hs.removeAttribute("UserIdToSearch");
                    %>
                </div>
            </div>
            </div>
    </body>
</html>
