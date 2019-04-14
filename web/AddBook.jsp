<%-- 
    Document   : AddBook
    Created on : Apr 10, 2019, 7:50:12 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Add Book</title>
        <style>
            body{
                margin: 0px;
            }
            .formdiv{
                text-align: center;
                border:1px solid #c60d0d;
                height:450px;
                width:500px;
                position:relative;
                left:450px;
                top:50px;
                border-radius: 10px;
                box-sizing: border-box;
            }
            .form{
                height:350px;
                width:400px;
                position:relative;
                left:50px;
                top:10px;
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
            ::placeholder{
                color:black;
                opacity: 1;
            }
        </style>
        <script>
            function validate(){
                var a=document["myform"]["booktitle"].value;
                var b=document["myform"]["isbn"].value;
                var c=document["myform"]["noofcopies"].value;
                var d=document["myform"]["booktype"].value;
                if(a==="" | b==="" | c==="" | d==="BATCH"){
                    alert("Please don't left field/fields empty!!! Fill all of them");
                    return false;
                }
            }
        </script>
    </head>
    <body>
 <% 
        if(session.getAttribute("LibFacLog")==null){
            response.sendRedirect("UserLogin.jsp");
        }
    %>
        <div class="formdiv">
            <br>
            <%
                HttpSession q=request.getSession();
                if(q.getAttribute("bookadded")!=null){
                    out.print("<p style='color:red;font-size:10px'>Book Added Successfully</p>");
                    q.removeAttribute("bookadded");
                }
            %>
            <h2 style="color:#c60d0d">Add Book</h2>
            <br>
            <form action="AddBook" class="form" name="myform">
                <input type="text" placeholder="BOOK TITLE" name="booktitle" class="input" required><br><br>
                <input type="text" placeholder="ISBN" name="isbn" class="input" required><br><br>
            <input type="number" placeholder="NO OF COPIES" name="noofcopies" class="input" required><br><br>
            <select name="booktype" class="select" required>
                <option selected="selected" disabled="disabled" >BOOK TYPE</option>
                <option value="Fiction">Fiction</option>
                <option value="Non-Fiction">Non-Fiction</option>
            </select><br><br>
            <input type="submit" value="ADD BOOK" class="submit" title="click to add book" onclick="return validate()">
            </form>
        </div>
    </body>
</html>
