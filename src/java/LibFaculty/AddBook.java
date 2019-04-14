/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import LibFacultyEntity.AddBookEnt;
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
public class AddBook extends HttpServlet {

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
            String isbn=request.getParameter("isbn");
            String booktitle=request.getParameter("booktitle");
            String booktype=request.getParameter("booktype");
            int noofcopies=Integer.parseInt(request.getParameter("noofcopies"));
            int copiesavail=noofcopies;
            AddBookEnt ab=new AddBookEnt();
            ab.setBookTitle(booktitle);
            ab.setBookType(booktype);
            ab.setNoOfCopies(noofcopies);
            ab.setCopiesAvailable(copiesavail);
            ab.setIsbn(isbn);
            Configuration cf=new Configuration();
            cf.configure("Cfg/AddBook.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session session=sf.openSession();
            Transaction tx =session.beginTransaction();
            session.save(ab);
            HttpSession hs=request.getSession();
            hs.setAttribute("bookadded",111);
            tx.commit();
            sf.close();
            response.sendRedirect("AddBook.jsp");
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
