/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import LibFacultyEntity.AddBookEnt;
import LibFacultyEntity.AddFineEnt;
import LibFacultyEntity.IssueBookEnt;
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
public class ReturnBook extends HttpServlet {

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
            try{
            String userid=request.getParameter("userid");
            String booktitle=request.getParameter("booktitle");
            Configuration cf=new Configuration();
            cf.configure("Cfg/IssueBook.cfg.xml");
            SessionFactory sf=cf.buildSessionFactory();
            Session s=sf.openSession();
            Transaction tx=s.beginTransaction();
            Query query=s.createQuery("from IssueBookEnt where userId='"+userid+"' and bookTitle='"+booktitle+"'");
            List<IssueBookEnt> ent=query.list();
            boolean f=false;
            for (IssueBookEnt e :ent ){
                if(e.getBookTitle().equals(booktitle) && e.getUserId().equals(userid)){
                    f=true;
                }
            }
            boolean dn=false;
            Date dueDate = null;
            if(f){
                Query q2=s.createQuery("from IssueBookEnt where userId ='"+userid+"' and bookTitle='"+booktitle+"'");
                  List<IssueBookEnt> ib=q2.list();
                for (IssueBookEnt i: ib){
                    dueDate=i.getDueDate();
                }
                Query q=s.createQuery("delete from IssueBookEnt where userId ='"+userid+"' and bookTitle='"+booktitle+"'");
                int done=q.executeUpdate();
                Configuration c=new Configuration();
                c.configure("Cfg/AddBook.cfg.xml");
                SessionFactory sff=c.buildSessionFactory();
                Session ss=sff.openSession();
                Transaction txx=ss.beginTransaction();
                Query qq=ss.createQuery("from AddBookEnt where bookTitle='"+booktitle+"'");
                List<AddBookEnt> abe=qq.list();
                for (AddBookEnt ab : abe){
                    int a=ab.getCopiesAvailable();
                    a++;
                    ab.setCopiesAvailable(a);
                    dn=true;
                }
                txx.commit();
                sff.close();
            }
            else{
                HttpSession hs=request.getSession();
               hs.setAttribute("UserIdInvalid", 111);
               response.sendRedirect("ReturnBook.jsp");
            }
            tx.commit();
            sf.close();
            if(dn){
                Date date=new Date();
                long Diff=date.getTime()-dueDate.getTime();
                int diffDays=(int)Diff/(24*60*60*1000);
                int FinePerDay=2;
                int fine=diffDays*FinePerDay;
                if(diffDays<0){
                    diffDays=0;
                    fine=0;
                }
                if(fine>0){
                AddFineEnt af=new AddFineEnt();
                Configuration cc=new Configuration();
                cc.configure("Cfg/FineAdd.cfg.xml");
                SessionFactory sffs=cc.buildSessionFactory();
                Session sss=sffs.openSession();
                Transaction txxx=sss.beginTransaction();
                af.setUserId(userid);
                af.setFine(fine);
                af.setFineForBook(booktitle);
                af.setNooffinedays(diffDays);
                af.setReturnDate(date);
                sss.save(af);
                txxx.commit();
                sffs.close();
                }
                HttpSession hs=request.getSession();
               hs.setAttribute("ReturnSuccess", 111);
               response.sendRedirect("ReturnBook.jsp");
            }
            else{
                HttpSession hs=request.getSession();
               hs.setAttribute("ReturnFailed", 111);
               response.sendRedirect("ReturnBook.jsp");
            }
            }
            catch(Exception ex){out.print("Catched" +ex.getMessage());}
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
