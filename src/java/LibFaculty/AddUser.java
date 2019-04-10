/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import LibFacultyEntity.AddUserEnt;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author PushkarSharma
 */
public class AddUser extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            String userid=request.getParameter("userid");
            String password=GenerateRandomPassword.RandomPassword();
            String username=request.getParameter("username");
            String fthname=request.getParameter("fthname");
            String mthname=request.getParameter("mthname");
            String email=request.getParameter("email");
            String mobileno=request.getParameter("mobileno");
            String batch=request.getParameter("batch");
            AddUserEnt aue=new AddUserEnt();
            aue.setBatch(batch);
            aue.setEmail(email);
            aue.setFathername(fthname);
            aue.setMobileno(mobileno);
            aue.setMothername(mthname);
            aue.setPassword(password);
            aue.setUserid(userid);
            aue.setUsername(username);
            Configuration cf=new Configuration();
            cf.configure("Cfg/AddUser.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session session=sf.openSession();
            Transaction tx=session.beginTransaction();
            session.save(aue);
            tx.commit();
            sf.close();
            HttpSession hs=request.getSession();
            hs.setAttribute("AddSuccess",111);
            response.sendRedirect("AddUser.jsp");
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