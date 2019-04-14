/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import LibFacultyEntity.AddBookEnt;
import LibFacultyEntity.IssueBookEnt;
import UserEntity.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
public class IssueBook extends HttpServlet {

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
        String batch=request.getParameter("batch");
        String booktitle=request.getParameter("booktitle");
        Configuration c2=new Configuration();
        c2.configure("Cfg/UserLogin.cfg.xml");
        SessionFactory sff1=c2.buildSessionFactory();
        Session s2=sff1.openSession();
        Transaction txt=s2.beginTransaction();
        Query q=s2.createQuery("from UserData where userId='"+userid+"'");
        boolean f=false;
        List<UserData> ul=q.list();
        int Validate3Books=0;
        for(UserData ud :ul){
            if(ud.getUserId().equals(userid)){
                f=true;
            }
        }
        
        Configuration c3=new Configuration();
        c3.configure("Cfg/IssueBook.cfg.xml");
        SessionFactory ff=c3.buildSessionFactory();
        Session sq=ff.openSession();
        Transaction tt=sq.beginTransaction();
        Query q2=sq.createQuery("from IssueBookEnt where userId='"+userid+"'");
        List<IssueBookEnt>i=q2.list();
        boolean b=false;
        for(IssueBookEnt e : i){
            if(e.getUserId().equals(userid) && e.getBookTitle().equals(booktitle)){
                b=true;
                break;
            }
            if(e.getUserId().equals(userid)){
                Validate3Books++;
            }
        }
        if(b){
            HttpSession hs=request.getSession();
            hs.setAttribute("AlreadyAssigned", 111); 
            response.sendRedirect("LibFacultyHome.jsp");
        }
        tt.commit();
        ff.close();
        
        List<UserData> u =q.list();
        for (UserData d :u){
            if(d.getUserId().equals(userid)){
                Validate3Books++;
            }
        }
        txt.commit();
        sff1.close();
        if(f){
            if(Validate3Books<=3 && b==false){
        Configuration c1=new Configuration();
        c1.configure("Cfg/AddBook.cfg.xml");
        SessionFactory sff=c1.buildSessionFactory();
        Session mysession=sff.openSession();
        Transaction txn=mysession.beginTransaction();
        Query query=mysession.createQuery("from AddBookEnt where bookTitle='"+booktitle+"'");
        List<AddBookEnt> ab=query.list();
        String BookIsbn=null;
        boolean flag=false;
        int Copies = 0;
        for (AddBookEnt a: ab){
            BookIsbn=a.getIsbn();           
            Copies=a.getCopiesAvailable();
            if(Copies>0 && a.getBookTitle().equals(booktitle)){
                flag=true;
                Copies--;
                a.setCopiesAvailable(Copies);
            }
        }
        txn.commit();
        sff.close();
        
        if(flag && b==false){
        IssueBookEnt ib=new IssueBookEnt();
        Date issueDate =new Date();
        Date DueDate=new Date(issueDate.getTime()+((1000*60*60*24)*10));
        ib.setBatch(batch);
        ib.setBookTitle(booktitle);
        ib.setIsbn(BookIsbn);
        ib.setUserId(userid);
        ib.setIssueDate(issueDate);
        ib.setDueDate(DueDate);
        Configuration cf=new Configuration();
        cf.configure("Cfg/IssueBook.cfg.xml");
        SessionFactory sf=cf.buildSessionFactory();
        Session session=sf.openSession();
        Transaction tx =session.beginTransaction();
        session.save(ib);
        HttpSession hs=request.getSession();
        hs.setAttribute("BookIssued", 111); 
        tx.commit();
        sf.close();
        response.sendRedirect("LibFacultyHome.jsp");
        }
        else{
            HttpSession hs=request.getSession();
            hs.setAttribute("NotIssued", 111); 
            response.sendRedirect("LibFacultyHome.jsp");
        }

        }
        else{
            HttpSession hs=request.getSession();
            hs.setAttribute("BooksExceeded", 111); 
            response.sendRedirect("LibFacultyHome.jsp");
        }
        }
        else{
            HttpSession hs=request.getSession();
            hs.setAttribute("UserNotFound", 111); 
            response.sendRedirect("LibFacultyHome.jsp");
        }
    }
        catch(Exception ex){}
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
