/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import LibFacultyEntity.AddFineEnt;
import LibFacultyEntity.PaidFineEnt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author PushkarSharma
 */
public class PayFine extends HttpServlet {

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
            String userid=request.getParameter("useridpayfine");
            Configuration cf=new Configuration();
            cf.configure("Cfg/FineAdd.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session s=sf.openSession();
            Transaction tx=s.beginTransaction();
            Query query1=s.createQuery("from AddFineEnt where userId='"+userid+"'");
            String fineforbook = null;
            int nooffinedays = 0;
            int fine = 0;
            Date returndate = null;
            List<AddFineEnt> af=query1.list();
            for (AddFineEnt a: af){
                if(a.getUserId().equals(userid)){
                    fineforbook=a.getFineForBook();
                    nooffinedays=a.getNooffinedays();
                    fine=a.getFine();
                    returndate=a.getReturnDate();
                }
            }
            tx.commit();
            sf.close();
            boolean don=false;
            boolean pro=false;
            Configuration cfc=new Configuration();
            cfc.configure("Cfg/FineAdd.cfg.xml");
            SessionFactory sfs=cfc.buildSessionFactory();
            Session sc=sfs.openSession();
            Transaction txt=sc.beginTransaction();
            Query query=sc.createQuery("delete from AddFineEnt where userId='"+userid+"'");
            int d=query.executeUpdate();
            don=true;
            txt.commit();
            sfs.close();
            if(don){
                PaidFineEnt pf=new PaidFineEnt();
                pf.setUserId(userid);
                pf.setFineForBook(fineforbook);
                pf.setNooffinedays(nooffinedays);
                pf.setPaidfine(fine);
                Date todaydate=new Date();
                pf.setPaidfinedate(todaydate);
                pf.setReturnDate(returndate);
                Configuration c=new Configuration();
                c.configure("Cfg/PaidFine.cfg.xml");
                SessionFactory sff=c.buildSessionFactory();
                Session ss=sff.openSession();
                Transaction txx=ss.beginTransaction();
                ss.save(pf);
                txx.commit();
                sff.close();
                pro=true;
            }
            if(pro){
                HttpSession h=request.getSession();
                h.setAttribute("finepaiddone", 111);
                response.sendRedirect("PayFine.jsp");
            }
            else if(!pro){
                HttpSession h=request.getSession();
                h.setAttribute("finepaidnotdone",111);
                response.sendRedirect("PayFine.jsp");
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
