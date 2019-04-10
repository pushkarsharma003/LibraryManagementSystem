<%-- 
    Document   : UserHome
    Created on : Apr 6, 2019, 3:20:39 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web\css\all.css">
        <style>
            .Search{
                text-align: center;
            }
            .inputSearch{
                height:50px;
                width:400px;
                border-radius: 10px;
                box-sizing: border-box;
                font-size: 16px;
                background-color: #E5E7E9;
                border:1px solid gray;
                position: relative;
                
            }
            .inputSearch:focus{
                border:2px solid dodgerblue;
                background-color: #E5E7E9;
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
            ::placeholder{                
                font-size: 18px; 
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        <div class="Search">
            <form action="SearchBook.jsp">
                <input type="text" class="inputSearch" placeholder="Search Any Book" ><br><br>
                <input type="submit" value="Search" class="SearchBtn" title="click to Search">
            </form>        
        </div>
    </body>
</html>
