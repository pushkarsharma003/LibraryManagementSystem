<%-- 
    Document   : ReturnBook
    Created on : Apr 12, 2019, 7:04:05 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html> 
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Return Book</title>
        <style>
            .ReturnBookForm{
                border:1px solid #c60d0d;
                height:350px;
                width:400px;
                border-radius: 10px;
            }
            .InsideForm{
                height:300px;
                width:350px;
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
            .submit{
                height:40px;
                width:300px;
                border:none;
                background-color:#c60d0d;
                cursor: pointer;
                color: white;
            }
            .main{
            display: flex;
        }
        .left{
            flex:0.7;
            border-right:1px solid lightgrey;
            text-align: center;
            min-height: 400px;
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
                <br><br>
                <center>
                <div class="ReturnBookForm">
            <%
                HttpSession ss=request.getSession();
                if(ss.getAttribute("UserIdInvalid")!=null){
                        out.println("<center><br><p style='color:red;font-size:10px;'>*User id have no such book </p></center>");
                        ss.removeAttribute("UserIdInvalid");
                    }
                else if(ss.getAttribute("ReturnSuccess")!=null){
                        out.println("<center><br><p style='color:red;font-size:10px;'>*Returned Successfully</p></center>");
                        ss.removeAttribute("ReturnSuccess");
                    }
                else if(ss.getAttribute("Return Failed")!=null){
                        out.println("<center><br><p style='color:red;font-size:10px;'>*Return Failed</p></center>");
                        ss.removeAttribute("Return Failed");
                    }
                    %>
                    <center>
            <div class="InsideForm">
                <center><h2 style="color:#c60d0d">Return Book</h2></center>
                <br><br>
                <center>
                <form action="ReturnBook">
                    <input type="text" placeholder="USER ID" class="input" name="userid" required><br><br>
                    <input type="text" placeholder="BOOK TITLE" class="input" name="booktitle" required><br><br>
                    <input type="submit" value="RETURN BOOK" class="submit"><br><br>
                </form>
                </center>
            </div>
                </center>
        </div>
            </center>
            </div>
        </div>
    </body>
</html>
