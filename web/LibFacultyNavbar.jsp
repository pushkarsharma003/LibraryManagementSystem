<%-- 
    Document   : LibFacultyNavbar
    Created on : Apr 9, 2019, 6:03:03 AM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web\css\all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <style>
            body{
                margin:0px;
                font-family: verdana;
            }
            .header{
                height:130px;
                width:100%;
            }
            .navbar{
                background-color: #c60d0d;
            }
            .navbtn{
                padding: 12px 0px;
                background-color: #c60d0d;
                color: #E5E7E9;
                border: none;
                cursor: pointer;
                font-family: cursive;
                box-sizing: border-box;
                width: 150px;
            }
            .navbtn:hover{
                font-weight: bold;
            }
            .subheader{
                background-color: lightgray;
                height: 30px;
                width:100%;
                font-family: cursive;
            }
            .cwus{
                font-size: 18px;
                position: relative;
                bottom: 8px;
                left: 10px;
            }
            .culogo{
                height:100px;
                width:220px;
                margin-left: 5px; 
            }
            .wcm{
                float: right;
                position: relative;
                top:20px;
                font-size: 15px;
                right:20px;
            }
            .logout{
                text-decoration:none;
                color: #c60d0d;
                font-weight: bold;
            }
            .cwuslogo{
                margin: 3px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="subheader">
                <a class="cwus">Connect With Us &nbsp;<b style="font-size:25px;position: relative;top:4px;">&#10551;</b></a> 
                &nbsp;&nbsp;
                <a href="http://www.facebook.com" title="connect on facebook"><img src="images/fblogo.png" height="20px" width="20px" class="cwuslogo"></a>
                <a href="http://www.instagram.com" title="connect on instagram"><img src="images/instalogo.png" height="20px" width="20px" class="cwuslogo"></a>
                <a href="http://www.linkedin.com" title="connect on linkedin"><img src="images/linkedinlogo.png" height="20px" width="20px" class="cwuslogo"></a>
                <a style="font-size: 13px;float:right;margin-right:12px;margin-top: 6px;">Contact Us :  +91-17878-76767,+91-17878-76868</a>
            </div>
                <img src="images/culogo.png" class="culogo" >
                <b class="wcm">
                    <%
                        out.print("Welcome lib123 (Library Faculty)");
                    %>
                    <a href='UserLogout.jsp' class="logout" title="click to logout">[ Logout ]</a>
                </b>
        </div>
        <br>
        <div class="navbar">
            <a href="LibFacultyHome.jsp" ><button class="navbtn" title="Home">HOME</button></a>
            <a href="AddUser.jsp" ><button class="navbtn" title="Add User">ADD USER</button></a>
            <a href="AddBook.jsp" ><button class="navbtn" title="Add Book">ADD BOOK</button></a>
        </div>
    </body>
</html>

