/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import UserEntity.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author PushkarSharma
 */
public class UserLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String userid=request.getParameter("userid");
        String password=request.getParameter("password");
        if(userid.equals("lib123") && password.equals("123")){            
            RequestDispatcher rd=request.getRequestDispatcher("LibFacultyHome.jsp");
            rd.forward(request, response);
            request.setAttribute("userid", userid);
            request.setAttribute("password", password);
        }
        else{
            String batch=request.getParameter("batch");
        UserData ul=new UserData();
        ul.setUserId(userid);
        ul.setPassword(password);
        ul.setBatch(batch);
        boolean LoginSuccess=false;
        Configuration cf=new Configuration();
        cf.configure("Cfg/UserLogin.cfg.xml");
        SessionFactory sf=cf.buildSessionFactory();
        Session s=sf.openSession();
        Transaction tx=s.beginTransaction();
        SQLQuery sq=s.createSQLQuery("Select userName from userdata where userId='"+userid+"' ");
        sq.setResultTransformer(Criteria .ALIAS_TO_ENTITY_MAP);
        List result=sq.list();
        Object username=null;
        for (Object object : result){
            Map row=(Map)object;
            username=row.get("userName");
        }
        Query query=s.createQuery("from UserData where userId='"+userid+"' and password='"+password+"' and batch='"+batch+"'");
        List <UserData> ud=query.list();
        for (UserData udd : ud){
            if(udd.getUserId().equals(userid) && udd.getPassword().equals(password) && udd.getBatch().equals(batch)){
                LoginSuccess=true;
                HttpSession hs=request.getSession();
                hs.setAttribute("userid",userid);
                hs.setAttribute("username",username);
                response.sendRedirect("UserHome.jsp");
            }
        }
        if(!LoginSuccess){
            HttpSession hs=request.getSession();
            hs.setAttribute("loginfailed",000);
            response.sendRedirect("UserLogin.jsp");
        }
        tx.commit();
        s.close();
        sf.close();
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
