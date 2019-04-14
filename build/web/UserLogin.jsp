<%-- 
    Document   : UserLogin
    Created on : Apr 5, 2019, 1:35:42 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
    <title>User Login</title>
    <style>
    body{
      font-family: arial;
      margin:0px;      
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
    .formdiv{
      border:1px solid lightgray;
      height:450px;
      border-radius: 10px;
      width:400px;
      text-align: center;
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
    .selectoption{
        color: black;
      background-color: white;
    }
    .data{
      display: flex;
    }
    .left{
      flex:2;
    }
    .right{
      flex:1;
    }
    .welhead{
      color: red;
      font-size: 30px;
      margin: 80px;
      font-family: cursive;
    }
    .image{
        height: 400px;
        width : 750px;
    }
    .culogo{
        height:100px;
        width: 220px;
    }
    ::placeholder{
        color:black;
        opacity: 1;
    }
    </style>
    <script>
        function myfunction(){
            var x=document["myform"]["userid"].value;
            if(x==="lib123"){
                document.getElementById('batch').disabled=true;
            }
            else{
                document.getElementById('batch').disabled=false;
                var res=x.substring(0,2);
                if(res==="16")
                {
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
        }
    </script>
  </head>
  <body>
    <br><br><br>
    <div class="data">
      <div class="left">
        <center>
            <img src="images/culogo.png" class="culogo">
            <br>
            <h class="welhead">Welcome to CU Library</h>
            <br><br>
            <img src="images/imageLogin.jpg" class="image">
        </center>   
      </div>
      <div class="right">
        <br><br><br><br>
        <div class="formdiv" >
          <br><br>
          <h2 style="color:#c60d0d;font-weight:normal;">LOG IN </h2><br><br>
          <form action="UserLogin" method="post" class="form" name="myform">
              <input type="text" class="input" name="userid" placeholder="USER ID" onchange="myfunction()" required><br><br>
            <input type="password" class="input" name="password" placeholder="PASSWORD"  required><br><br>
            <select class="select" name="batch" id="batch" required >
              <option class="selectoption" disabled="disabled" selected="selected">BATCH</option>
              <option class="selectoption" value="2016">2016</option>
              <option class="selectoption" value="2017">2017</option>
              <option class="selectoption" value="2018">2018</option>
              <option class="selectoption" value="2019">2019</option>
            </select><br><br>
            <input type="submit" value="LOGIN" class="submit" title="click to login">
          </form>
          <%
            HttpSession ht=request.getSession();
            if(ht.getAttribute("loginfailed")!= null){
                out.println("<script>alert('username or password is incorrect')</script>");
                out.println("<br><p style='color:red;font-size:12px;'>*Login Failed</p>");
                ht.removeAttribute("loginfailed");
            }   
        %>
        </div>
      </div>
    </div>
  </body>
</html>

