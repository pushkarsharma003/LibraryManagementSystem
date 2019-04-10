<%-- 
    Document   : UserInfo
    Created on : Apr 7, 2019, 9:52:54 PM
    Author     : PushkarSharma
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Info</title>
    </head>
    <body>
        <%
            HttpSession sr=request.getSession();
            Object ui=sr.getAttribute("userid");
            Configuration cf=new Configuration();
            cf.configure("Cfg/UserLogin.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session s=sf.openSession();
            Transaction tx=s.beginTransaction();
            SQLQuery sql=s.createSQLQuery("Select * from userdata where userId='"+ui+"'");
            sql.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
            List myinfo =sql.list();
            Object name=null;
            Object id=null;
            Object fthname=null;
            Object mthname=null;
            Object batch=null;
            Object email=null;
            Object mobileno=null;
            for (Object myObject : myinfo ){
                Map map=(Map) myObject;
                name=map.get("userName");
                id=map.get("userId");
                fthname=map.get("fatherName");
                mthname=map.get("motherName");
                batch=map.get("batch");
                email=map.get("email");
                mobileno=map.get("mobileno");
            }
            out.print("<div style='font-size:18px;border-radius:10px;width:450px;height:350px;border:1px solid #c60d0d;position:relative;left:450px;top:50px'>");
            out.print("<div style='height:200px;width:350px;position:relative;left:50px;top:70px;'>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Userid : </a>"+id+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Username : </a>"+name+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Father's Name : </a>"+fthname+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Mother's Name : </a>"+mthname+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Batch : </a>"+batch+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Email Id : </a>"+email+"<br>");
            out.print("<a style='font-family:cursive;color:#c60d0d;font-weight:bold;font-size:20px;'>Mobile Number : </a>"+mobileno+"<br>");
            out.print("</div>");
            out.print("</div>");
            tx.commit();
            s.close();
            sf.close();
        %>
    </body>
</html>
