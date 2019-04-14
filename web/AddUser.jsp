<%-- 
    Document   : AddUser
    Created on : Apr 9, 2019, 9:43:00 AM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <title>Add User</title>
        <style>
            body{
                margin: 0px;
            }
            .formdiv{
                text-align: center;
                border:1px solid #c60d0d;
                height:600px;
                width:500px;
                position:relative;
                left:450px;
                top:50px;
                border-radius: 10px;
            }
            .form{
                height:500px;
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
    ::placeholder{
        color:black;
        opacity: 1;
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
                var b=document["myform"]["username"].value;
                var d=document["myform"]["fthname"].value;
                var e=document["myform"]["mthname"].value;
                var f=document["myform"]["mobileno"].value;
                var g=document["myform"]["email"].value;
                if(a==="" | b==="" | d==="" | e==="" | f==="" | g==="" ){
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
            <%
                HttpSession q=request.getSession();
                if(q.getAttribute("AddSuccess")!=null){
                    out.print("<p style='color:red;font-size:10px'>User Added Successfully</p>");
                    q.removeAttribute("AddSuccess");
                }
            %>
            <form class="form" action="AddUser" name="myform">
                <h2 style="color:#c60d0d">Add User</h2>
                <br>
                <input type="text" placeholder="USER ID" name="userid" class="input" onchange="setBatch()"><br><br>
                <input type="text" placeholder="USER NAME" name="username" class="input"><br><br>
                <select class="select" name="batch" id="batch">
                    <option class="selectoption" disabled="disabled" selected="selected">BATCH</option>
                    <option class="selectoption" value="2016">2016</option>
                    <option class="selectoption" value="2017">2017</option>
                    <option class="selectoption" value="2018">2018</option>
                    <option class="selectoption" value="2019">2019</option>
                </select><br><br>
                <input type="text" placeholder="FATHER'S NAME" name="fthname" class="input"><br><br>
                <input type="text" placeholder="MOTHER'S NAME" name="mthname" class="input"><br><br>
                <input type="text" placeholder="EMAIL" name="email" class="input"><br><br>
                <input type="text" placeholder="MOBILE NUMBER" name="mobileno" class="input"><br><br>
                <input type="submit" value="SUBMIT" class="submit" title="click to submit" onclick="return validate()">
            </form>
            <br>
        </div>
    </body>
</html>
