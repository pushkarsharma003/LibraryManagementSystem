<%-- 
    Document   : DeleteUser
    Created on : Apr 9, 2019, 2:21:39 PM
    Author     : PushkarSharma
--%>

<%@page import="java.util.Map"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="LibFacultyNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
        <style>
            body{
                margin: 0px;
                
            }
            .formdiv{
                text-align: center;
                border:1px solid #c60d0d;
                height:150px;
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
                top:30px;
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
            }
            .submit{
                height:40px;
                width:300px;
                border:none;
                background-color:#c60d0d;
                cursor: pointer;
                color: white;
            }    
            ::placeholder{
                color:black;
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <div class="formdiv">
            <form class="form" action="DeleteUser" >
                <input type="text" placeholder="USER ID" name="userid" class="input"><br><br>
                <input type="submit" value="DELETE" class="submit" title="click to delete" onclick="alert('User will be permanently deleted')">
            </form>
            <br>
        </div>
        <br>
        <%
            Configuration c=new Configuration();
            c.configure("Cfg/UserLogin.cfg.xml");
            SessionFactory sf=c.buildSessionFactory();
            Session s=sf.openSession();
            Transaction tx=s.beginTransaction();
            SQLQuery sql=s.createSQLQuery("select * from userdata");
            sql.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);           
            List l=sql.list();
            for (Object o: l){
                Map map=(Map) o;
                out.print("Userid : "+map.get("userId"));
                out.print("<br>");
                out.print("Username : "+map.get("userName"));
                out.print("<br>");
                out.print("Batch : "+map.get("batch"));
                out.print(map.get("<br>"));
                out.print("Father's Name : "+map.get("fatherName"));
                out.print(map.get("<br>"));
                out.print("Mother's Name : "+map.get("motherName"));
                out.print(map.get("<br>"));
                out.print("Email : "+map.get("email"));
                out.print(map.get("<br>"));
                out.print("Mobile Number : "+map.get("mobileno"));                                
                out.print(map.get("<br>"));
            }
            tx.commit();
            sf.close();
        %>
    </body>
</html>
