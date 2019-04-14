<%-- 
    Document   : UserHome
    Created on : Apr 6, 2019, 3:20:39 PM
    Author     : PushkarSharma
--%>

<%@page import="java.util.List"%>
<%@page import="LibFacultyEntity.AddBookEnt"%>
<%@page import="LibFacultyEntity.AddBookEnt"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css">
        <link rel="icon" type="image/ico" href="images/culogo1.png"/>
        <style>
            .Search{
                text-align: center;
                height:200px;
                width:500px;
                border: 1px solid lightgray;
                border-radius: 10px;
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
            .SearchBtn:hover{
                box-shadow: 0px 0px 10px gray;
            }
            ::placeholder{                
                font-size: 18px; 
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <% 
        if(session.getAttribute("username")==null && session.getAttribute("userid")==null){
            response.sendRedirect("UserLogin.jsp");
        }  
    %>
        <br>
        <br>
        <center>
        <div class="Search">
            <br><br>
            <form action="UserSearchBookBN.jsp">
                <input type="text" class="inputSearch" placeholder="Enter Book Name to Search" name="booktitle" title="search book by name" required><br><br>
                <input type="submit" value="Search" class="SearchBtn" title="click to Search">
            </form>
        </div>
            </center>
        <%
            HttpSession hs=request.getSession();
            String bt=(String)hs.getAttribute("SearchBookTitle");
            if(hs.getAttribute("SearchBookTitle")!=null){
            Configuration cf=new Configuration();
            cf.configure("Cfg/AddBook.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session s =sf.openSession();
            Transaction tx=s.beginTransaction();
            Query query=s.createQuery("from AddBookEnt where bookTitle='"+bt+"'");
            List<AddBookEnt> ab=query.list();
            boolean found=false;
            for (AddBookEnt a: ab){    
                if(a.getBookTitle().equals(bt)){
                    found=true;
                    out.println("<style>table,th,td{border:1px solid black;margin:15px;border-collapse:collapse;}th,td{padding:10px}</style>");
                    out.print("<center><h4 style='color:dodgerblue'>Your results are : </h4></center>");
                    out.println("<center><table>");
                    out.println("<tr style='color:green'>");
                    out.println("<th>Book Title</th><th>Book Type</th><th>Isbn</th>");
                    out.println("<th>Copies Available</th><th>Total Copies</th>");
                    out.print("<tr>");
                    out.print("<td>"+a.getBookTitle()+"</td>");
                    out.print("<td>"+a.getBookType()+"</td>");
                    out.print("<td>"+a.getIsbn()+"</td>");
                    out.print("<td>"+a.getCopiesAvailable()+"</td>");
                    out.print("<td>"+a.getNoOfCopies()+"</td>");
                    out.print("</tr>");
                    }
                }
            out.println("</tr>");
            out.print("</center></table><br>");
            tx.commit();
            sf.close();
            hs.removeAttribute("SearchBookTitle");
            if(!found){
                out.print("<br><center><a style='color:dodgerblue;'>Book Not Found :( </a></center>");                
            }
            }
        %>
    </body>
</html>
