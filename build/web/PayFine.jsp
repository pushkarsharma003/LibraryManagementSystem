<%-- 
    Document   : PayFine
    Created on : Apr 13, 2019, 5:03:49 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Pay Fine</title>
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
                <center><h4 style="color:#c60d0d">Pay Fine</h4></center>
                <center>
                    <div class="SearchByIdForm">
                        <br><br>
                            <form action="PayFine">    
                            <input type="text" placeholder="Enter Id" class="input" name="useridpayfine"><br><br>
                            <input type="submit" value="Pay fine" class="SearchBtn" title="click to pay fine">
                        </form>
                    </div>
                </center>
                <%
                        HttpSession ss=request.getSession();
                        if(ss.getAttribute("finepaiddone")!=null){
                            out.println("<center><br><p style='color:red;font-size:14px;'>*Transaction Successfull, Thanks</p></center>");
                            ss.removeAttribute("finepaiddone");
                        }
                        else if(ss.getAttribute("finepaidnotdone")!=null){
                            out.println("<center><br><p style='color:red;font-size:14px;'>*Transaction Unsuccessfull, Please try again </p></center>");
                            ss.removeAttribute("finepaidnotdone");
                        }
                    %>
            </div>
        </div>
    </body>
</html>
