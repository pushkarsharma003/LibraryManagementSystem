package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class UserNavbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
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
      out.write("            .cwus{\n");
      out.write("                margin-left: 10px;\n");
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
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <div class=\"subheader\">\n");
      out.write("                <a class=\"cwus\">Connect With Us</a>\n");
      out.write("            </div>\n");
      out.write("                <img src=\"images/culogo.png\" class=\"culogo\" >\n");
      out.write("                <c class=\"wcm\">\n");
      out.write("                    ");

                        HttpSession h=request.getSession();
                        Object userid=h.getAttribute("userid");
                        Object username=h.getAttribute("username");
                        if(userid!=null){
                            out.print("Welcome "+ username+" ("+userid+")");
                        }
                    
      out.write("\n");
      out.write("                    <a href='UserLogout.jsp' class=\"logout\" title=\"click to logout\">[ Logout ]</a>\n");
      out.write("                </c>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("            <a href=\"UserHome.jsp\"><button class=\"navbtn\">HOME</button></a>\n");
      out.write("            <a href=\"UserInfo.jsp\"><button class=\"navbtn\">USER INFO</button></a>\n");
      out.write("            <a href=\"#\"><button class=\"navbtn\">MY BOOKS</button></a>\n");
      out.write("            <a href=\"#\"><button class=\"navbtn\">FEEDBACK</button></a>\n");
      out.write("            <a href=\"#\"><button class=\"navbtn\">FINE</button></a>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
