package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import LibFacultyEntity.AddBookEnt;
import LibFacultyEntity.AddBookEnt;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public final class UserHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/UserNavbar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"fontawesome-free-5.7.2-web/css/all.css\">\n");
      out.write("        <link rel=\"icon\" type=\"image/ico\" href=\"images/culogo1.png\"/>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                margin:0px;\n");
      out.write("                font-family: verdana;\n");
      out.write("            }\n");
      out.write("            .header{\n");
      out.write("                height:130px;\n");
      out.write("                width:100%;\n");
      out.write("            }\n");
      out.write("            .navbar{\n");
      out.write("                background-color: #c60d0d;\n");
      out.write("            }\n");
      out.write("            .navbtn{\n");
      out.write("                padding: 12px 0px;\n");
      out.write("                background-color: #c60d0d;\n");
      out.write("                color: #E5E7E9;\n");
      out.write("                border: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-family: cursive;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                width: 150px;\n");
      out.write("            }\n");
      out.write("            .navbtn:hover{\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            .subheader{\n");
      out.write("                background-color: lightgray;\n");
      out.write("                height: 30px;\n");
      out.write("                width:100%;\n");
      out.write("                font-family: cursive;\n");
      out.write("            }\n");
      out.write("            .culogo{\n");
      out.write("                height:100px;\n");
      out.write("                width:220px;\n");
      out.write("                margin-left: 5px; \n");
      out.write("            }\n");
      out.write("            .wcm{\n");
      out.write("                float: right;\n");
      out.write("                position: relative;\n");
      out.write("                top:20px;\n");
      out.write("                font-size: 15px;\n");
      out.write("                right:20px;\n");
      out.write("            }\n");
      out.write("            .logout{\n");
      out.write("                text-decoration:none;\n");
      out.write("                color: #c60d0d;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            .cwus{\n");
      out.write("                font-size: 18px;\n");
      out.write("                position: relative;\n");
      out.write("                bottom: 8px;\n");
      out.write("                left: 10px;\n");
      out.write("            }\n");
      out.write("            .cwuslogo{\n");
      out.write("                margin: 3px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"header\">\n");
      out.write("             <div class=\"subheader\">\n");
      out.write("                <a class=\"cwus\">Connect With Us &nbsp;<b style=\"font-size:25px;position: relative;top:4px;\">&#10551;</b></a> \n");
      out.write("                &nbsp;&nbsp;\n");
      out.write("                <a href=\"http://www.facebook.com\" title=\"connect on facebook\"><img src=\"images/fblogo.png\" height=\"20px\" width=\"20px\" class=\"cwuslogo\"></a>\n");
      out.write("                <a href=\"http://www.instagram.com\" title=\"connect on instagram\"><img src=\"images/instalogo.png\" height=\"20px\" width=\"20px\" class=\"cwuslogo\"></a>\n");
      out.write("                <a href=\"http://www.linkedin.com\" title=\"connect on linkedin\"><img src=\"images/linkedinlogo.png\" height=\"20px\" width=\"20px\" class=\"cwuslogo\"></a>\n");
      out.write("                <a style=\"font-size: 13px;float:right;margin-right:12px;margin-top: 6px;\">Contact Us :  +91-17878-76767,+91-17878-76868</a>\n");
      out.write("            </div>\n");
      out.write("                <img src=\"images/culogo.png\" class=\"culogo\" >\n");
      out.write("                <b class=\"wcm\">\n");
      out.write("                    ");

                        HttpSession h=request.getSession();
                        Object userid=h.getAttribute("userid");
                        Object username=h.getAttribute("username");
                        if(userid!=null){
                            out.print("Welcome "+ username+" ("+userid+")");
                        }
                    
      out.write("\n");
      out.write("                    <a href='UserLogout.jsp' class=\"logout\" title=\"click to logout\">[ Logout ]</a>\n");
      out.write("                </b>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("            <a href=\"UserHome.jsp\"><button class=\"navbtn\">HOME</button></a>\n");
      out.write("            <a href=\"UserInfo.jsp\"><button class=\"navbtn\">USER INFO</button></a>\n");
      out.write("            <a href=\"UserMyBooks.jsp\"><button class=\"navbtn\">MY BOOKS</button></a>\n");
      out.write("            <a href=\"AboutLibrary.jsp\"><button class=\"navbtn\" title=\"Feedback\">ABOUT LIBRARY</button></a>\n");
      out.write("            <a href=\"UserMyFine.jsp\"><button class=\"navbtn\">MY FINE</button></a>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Home</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"fontawesome-free-5.7.2-web/css/all.css\">\r\n");
      out.write("        <link rel=\"icon\" type=\"image/ico\" href=\"images/culogo1.png\"/>\r\n");
      out.write("        <style>\r\n");
      out.write("            .Search{\r\n");
      out.write("                text-align: center;\r\n");
      out.write("                height:200px;\r\n");
      out.write("                width:500px;\r\n");
      out.write("                border: 1px solid lightgray;\r\n");
      out.write("                border-radius: 10px;\r\n");
      out.write("            }\r\n");
      out.write("            .inputSearch{\r\n");
      out.write("                height:50px;\r\n");
      out.write("                width:400px;\r\n");
      out.write("                border-radius: 10px;\r\n");
      out.write("                box-sizing: border-box;\r\n");
      out.write("                font-size: 16px;\r\n");
      out.write("                background-color: #E5E7E9;\r\n");
      out.write("                border:1px solid gray;\r\n");
      out.write("                position: relative;\r\n");
      out.write("            }\r\n");
      out.write("            .inputSearch:focus{\r\n");
      out.write("                border:2px solid dodgerblue;\r\n");
      out.write("                background-color: #E5E7E9;\r\n");
      out.write("                box-shadow: 0px 0px 10px dodgerblue;\r\n");
      out.write("            }\r\n");
      out.write("            .SearchBtn{\r\n");
      out.write("                background-color: dodgerblue;\r\n");
      out.write("                border: none;\r\n");
      out.write("                padding: 14px 30px;\r\n");
      out.write("                color:white;\r\n");
      out.write("                font-family: cursive;\r\n");
      out.write("                border-radius: 10px;\r\n");
      out.write("                cursor: pointer;\r\n");
      out.write("            }\r\n");
      out.write("            .SearchBtn:hover{\r\n");
      out.write("                box-shadow: 0px 0px 10px gray;\r\n");
      out.write("            }\r\n");
      out.write("            ::placeholder{                \r\n");
      out.write("                font-size: 18px; \r\n");
      out.write("                font-family: cursive;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
 
        if(session.getAttribute("username")==null && session.getAttribute("userid")==null){
            response.sendRedirect("UserLogin.jsp");
        }  
    
      out.write("\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <center>\r\n");
      out.write("        <div class=\"Search\">\r\n");
      out.write("            <br><br>\r\n");
      out.write("            <form action=\"UserSearchBookBN.jsp\">\r\n");
      out.write("                <input type=\"text\" class=\"inputSearch\" placeholder=\"Enter Book Name to Search\" name=\"booktitle\" title=\"search book by name\" required><br><br>\r\n");
      out.write("                <input type=\"submit\" value=\"Search\" class=\"SearchBtn\" title=\"click to Search\">\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("            </center>\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
