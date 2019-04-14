package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class UserLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <head>\n");
      out.write("      <link rel=\"stylesheet\" href=\"fontawesome-free-5.7.2-web/css/all.css\">\n");
      out.write("        <link rel=\"icon\" type=\"image/ico\" href=\"images/culogo1.png\"/>\n");
      out.write("    <title>User Login</title>\n");
      out.write("    <style>\n");
      out.write("    body{\n");
      out.write("      font-family: arial;\n");
      out.write("      margin:0px;      \n");
      out.write("    }\n");
      out.write("    .input{\n");
      out.write("      height:40px;\n");
      out.write("      width:300px;\n");
      out.write("      border-radius :5px;\n");
      out.write("      border:1px solid #E5E7E9;\n");
      out.write("      background-color: #E5E7E9;\n");
      out.write("      box-sizing: border-box;\n");
      out.write("    }\n");
      out.write("    .input:focus{\n");
      out.write("      border:2px solid lightblue;\n");
      out.write("      background-color: white;\n");
      out.write("      box-shadow: 0px 0px 10px dodgerblue;\n");
      out.write("    }\n");
      out.write("    .submit{\n");
      out.write("      height:40px;\n");
      out.write("      width:300px;\n");
      out.write("      border:none;\n");
      out.write("      background-color:#c60d0d;\n");
      out.write("      cursor: pointer;\n");
      out.write("      color: white;\n");
      out.write("    }\n");
      out.write("    .formdiv{\n");
      out.write("      border:1px solid lightgray;\n");
      out.write("      height:450px;\n");
      out.write("      border-radius: 10px;\n");
      out.write("      width:400px;\n");
      out.write("      text-align: center;\n");
      out.write("    }\n");
      out.write("    .select{\n");
      out.write("      height:40px;\n");
      out.write("      width:300px;\n");
      out.write("      background-color: #E5E7E9;\n");
      out.write("      border: none;\n");
      out.write("    }\n");
      out.write("    .select:focus{\n");
      out.write("      border:2px solid lightblue;\n");
      out.write("      background-color: white;\n");
      out.write("    }\n");
      out.write("    .selectoption{\n");
      out.write("        color: black;\n");
      out.write("      background-color: white;\n");
      out.write("    }\n");
      out.write("    .data{\n");
      out.write("      display: flex;\n");
      out.write("    }\n");
      out.write("    .left{\n");
      out.write("      flex:2;\n");
      out.write("    }\n");
      out.write("    .right{\n");
      out.write("      flex:1;\n");
      out.write("    }\n");
      out.write("    .welhead{\n");
      out.write("      color: red;\n");
      out.write("      font-size: 30px;\n");
      out.write("      margin: 80px;\n");
      out.write("      font-family: cursive;\n");
      out.write("    }\n");
      out.write("    .image{\n");
      out.write("        height: 400px;\n");
      out.write("        width : 750px;\n");
      out.write("    }\n");
      out.write("    .culogo{\n");
      out.write("        height:100px;\n");
      out.write("        width: 220px;\n");
      out.write("    }\n");
      out.write("    ::placeholder{\n");
      out.write("        color:black;\n");
      out.write("        opacity: 1;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write("    <script>\n");
      out.write("        function myfunction(){\n");
      out.write("            var x=document[\"myform\"][\"userid\"].value;\n");
      out.write("            if(x===\"lib123\"){\n");
      out.write("                document.getElementById('batch').disabled=true;\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                document.getElementById('batch').disabled=false;\n");
      out.write("                var res=x.substring(0,2);\n");
      out.write("                if(res===\"16\")\n");
      out.write("                {\n");
      out.write("                    document.getElementById('batch').selectedIndex=\"1\";\n");
      out.write("                }\n");
      out.write("                else if(res===\"17\"){\n");
      out.write("                    document.getElementById('batch').selectedIndex=\"2\";\n");
      out.write("                }\n");
      out.write("                else if(res===\"18\"){\n");
      out.write("                    document.getElementById('batch').selectedIndex=\"3\";\n");
      out.write("                }\n");
      out.write("                else if(res===\"19\"){\n");
      out.write("                    document.getElementById('batch').selectedIndex=\"4\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <br><br><br>\n");
      out.write("    <div class=\"data\">\n");
      out.write("      <div class=\"left\">\n");
      out.write("        <center>\n");
      out.write("            <img src=\"images/culogo.png\" class=\"culogo\">\n");
      out.write("            <br>\n");
      out.write("            <h class=\"welhead\">Welcome to CU Library</h>\n");
      out.write("            <br><br>\n");
      out.write("            <img src=\"images/imageLogin.jpg\" class=\"image\">\n");
      out.write("        </center>   \n");
      out.write("      </div>\n");
      out.write("      <div class=\"right\">\n");
      out.write("        <br><br><br><br>\n");
      out.write("        <div class=\"formdiv\" >\n");
      out.write("          <br><br>\n");
      out.write("          <h2 style=\"color:#c60d0d;font-weight:normal;\">LOG IN </h2><br><br>\n");
      out.write("          <form action=\"UserLogin\" method=\"post\" class=\"form\" name=\"myform\">\n");
      out.write("              <input type=\"text\" class=\"input\" name=\"userid\" placeholder=\"USER ID\" onchange=\"myfunction()\" required><br><br>\n");
      out.write("            <input type=\"password\" class=\"input\" name=\"password\" placeholder=\"PASSWORD\"  required><br><br>\n");
      out.write("            <select class=\"select\" name=\"batch\" id=\"batch\" required >\n");
      out.write("              <option class=\"selectoption\" disabled=\"disabled\" selected=\"selected\">BATCH</option>\n");
      out.write("              <option class=\"selectoption\" value=\"2016\">2016</option>\n");
      out.write("              <option class=\"selectoption\" value=\"2017\">2017</option>\n");
      out.write("              <option class=\"selectoption\" value=\"2018\">2018</option>\n");
      out.write("              <option class=\"selectoption\" value=\"2019\">2019</option>\n");
      out.write("            </select><br><br>\n");
      out.write("            <input type=\"submit\" value=\"LOGIN\" class=\"submit\" title=\"click to login\">\n");
      out.write("          </form>\n");
      out.write("          ");

            HttpSession ht=request.getSession();
            if(ht.getAttribute("loginfailed")!= null){
                out.println("<script>alert('username or password is incorrect')</script>");
                out.println("<br><p style='color:red;font-size:12px;'>*Login Failed</p>");
                ht.removeAttribute("loginfailed");
            }   
        
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
