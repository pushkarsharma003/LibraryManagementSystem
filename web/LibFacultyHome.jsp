<%-- 
    Document   : LibFacultyHome
    Created on : Apr 8, 2019, 6:48:57 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Home</title>
    </head>
    <style>
        .main{
            display: flex;
        }
        .left{
            flex:0.7;
            border-right:1px solid lightgrey;
            text-align: center;
            height: auto;
            min-height: 550px;
        }
        .right{
            flex:3;
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
            .select{
                height:40px;
                width:300px;
                background-color: #E5E7E9;
                border: none;
            }
            .select:focus{
                border:2px solid lightblue;
                background-color: white;
            }
            .form{
                height:350px;
                width:300px;
                position: relative;
                left:100px;
                top:50px;
            }
            .formdiv{
                text-align: center;
                border:1px solid #c60d0d;
                height:450px;
                width:500px;
                position:relative;
                left:250px;
                top:50px;
                border-radius: 10px;
            }
            .leftNav
            {
                color:#c60d0d;
            }
    </style>
    <script>
            function setBatch(){
                var x=document["myform"]["userid"].value;
                var res=x.substring(0,2);
                if(res==="16"){
                    document.getElementById('batch').selectedIndex="1";
                }
                else if(res==="17"){
                    document.getElementById('batch').selectedIndex="2";
                }
                else if(res==="18"){
                    document.getElementById('batch').selectedIndex="3";
                }
                else if(res==="19"){
                    document.getElementById('batch').selectedIndex="4";
                }
            }
            function validate(){
                var a=document["myform"]["userid"].value;
                var b=document["myform"]["isbn"].value;
                var c=document["myform"]["booktitle"].value;
                if(a==="" | b==="" | c===""){
                    alert("Please don't left field/fields empty!!! Fill all of them");
                    return false;
                }
            }
        </script>
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
                <a href="PayFine.jsp" title="Click to pay fine" class="leftNav">Paid Fine History</a>
            </div>
            <div class="right">
                <div class="formdiv">
                    <%
                        HttpSession ss=request.getSession();
                        if(ss.getAttribute("BookIssued")!=null && ss.getAttribute("NotIssued")==null){
                            out.println("<br><p style='color:red;font-size:10px;'>*Book Issued Successfully</p>");
                            ss.removeAttribute("BookIssued");
                        }
                        else if(ss.getAttribute("BookIssued")==null && ss.getAttribute("NotIssued")!=null){
                            out.println("<br><p style='color:red;font-size:10px;'>*No Book Available</p>");
                            ss.removeAttribute("NotIssued");
                        }
                        else if(ss.getAttribute("UserNotFound")!=null){
                            out.println("<br><p style='color:red;font-size:10px;'>*Userid Not Found</p>");
                            ss.removeAttribute("UserNotFound");
                        }
                        else if(ss.getAttribute("BooksExceeded")!=null | ss.getAttribute("AlreadyAssigned")!=null){
                            out.println("<br><p style='color:red;font-size:10px;'>*Not issued due to exceeded quantity or User already have that book</p>");
                            ss.removeAttribute("BooksExceeded");
                            ss.removeAttribute("AlreadyAssigned");
                        }
                    %>
                <form class="form" action="IssueBook" name="myform">
                <h2 style="color:#c60d0d">Issue Book</h2>
                <br>
                <input type="text" placeholder="USER ID" name="userid" class="input" onchange="setBatch()" required><br><br>
                <select class="select" name="batch" id="batch" required>
                    <option class="selectoption" disabled="disabled" selected="selected">BATCH</option>
                    <option class="selectoption" value="2016">2016</option>
                    <option class="selectoption" value="2017">2017</option>
                    <option class="selectoption" value="2018">2018</option>
                    <option class="selectoption" value="2019">2019</option>
                </select><br><br>
                <input type="text" placeholder="BOOK TITLE" name="booktitle" class="input" required><br><br>
                <input type="submit" value="ISSUE BOOK" class="submit" title="click to submit" onclick="return validate()">
            </form>
            </div>
            </div>
        </div>
    </body>
</html>
