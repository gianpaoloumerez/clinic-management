package servlet;



import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "index_login_process", urlPatterns = {"/index_login_process"})
public class index_login_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession session = request.getSession();   
        String chk = "default";
        Date currentdate = new Date();
        DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
        String cdate =DFormat.format(currentdate);
        DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
        String ct = DFormatlog.format(currentdate);
    
    try
    {
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinic_mngmt", "root", "P@ssw0rd");
    Statement st = con.createStatement();
    Statement stID = con.createStatement();
    ResultSet rsdoctor, rspersonnel,rsID, rsdoccheck, rsperscheck;
    PreparedStatement prp=null;
    PreparedStatement prpCHKDOC=null;
    PreparedStatement prpCHKPERS=null;
    
        prpCHKDOC = con.prepareStatement("select username from doctor");
        rsdoccheck = prpCHKDOC.executeQuery();
        while (rsdoccheck.next())
            {
                if (userid.equals(rsdoccheck.getString("username")))
                {
                    chk = "doctor";
                }
            }
        
        prpCHKPERS = con.prepareStatement("select username from receptionist");
        rsperscheck = prpCHKPERS.executeQuery();
        while (rsperscheck.next())
            {
                if (userid.equals(rsperscheck.getString("username")))
                {
                    chk = "personnel";
                }
            }
    
    try
    {
        if (chk.equals("doctor"))
        {   
            prp = con.prepareStatement("select username, password, count, acct_status,name from doctor where username = '" + userid + "'");
            rsdoctor = prp.executeQuery();
            rsdoctor.first();
            
            if (pwd.equals(rsdoctor.getString("password"))) 
            {
                if (rsdoctor.getString("acct_status").equals("active"))
                    {
                        session.setAttribute("acct_Type", "doctor");
                        session.setAttribute("doctorID", rsdoctor.getString("count"));
                        session.setAttribute("doctorName", rsdoctor.getString("name"));
                        session.setAttribute("uname", userid);
                        
                        String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('doctor', '"+userid+"','"+cdate+"','Log In','Doctor Log In','"+ct+"')";
                        PreparedStatement prpLog = con.prepareStatement(sqlLog);
                        prpLog.execute();
                        
                        response.sendRedirect("doctor_dashboard_today.jsp");
                    }
                else if (rsdoctor.getString("acct_status").equals("inactive"))
                    {
                        session.setAttribute("login_error", "Account Deactivated Please Contact Admin");
                        response.sendRedirect("index.jsp");
                    }
            } 
            else
            {
                session.setAttribute("login_error", "Invalid Username or Password");
                response.sendRedirect("index.jsp");
            }
        }
        
        else if (chk.equals("personnel"))
        {
            rspersonnel = st.executeQuery("select * from receptionist where username='"+userid+"' and password='"+pwd+"'");
            if (rspersonnel.next()) 
            {
                if (rspersonnel.getString("acct_status").equals("active"))
                {  
                    
                    session.setAttribute("acct_Type", "personnel");
                    session.setAttribute("personnelID", rspersonnel.getString("count"));
                    session.setAttribute("personnelName", rspersonnel.getString("name"));
                    session.setAttribute("uname", userid);
                    
                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+userid+"','"+cdate+"','Log In','Personnel Log In','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();
                    response.sendRedirect("personnel_dashboard.jsp");
                }
                else if (rspersonnel.getString("acct_status").equals("inactive"))
                {
                    session.setAttribute("login_error", "Account Deactivated Please Contact Admin");
                    response.sendRedirect("index.jsp");
                }
            } 
            else
            {
                session.setAttribute("login_error", "Invalid Username or Password");
                response.sendRedirect("index.jsp");
            }
        }
        else if (chk.equals("default"))
        {
                session.setAttribute("login_error", "Invalid Username or Password ");
                response.sendRedirect("index.jsp");
        }
        
    }
    catch (Exception e)
    {
            session.setAttribute("login_error", "Invalid Username or Password ");
            response.sendRedirect("index.jsp");
    }
    
    
    }
    catch (Exception e)
    {
        session.setAttribute("login_error", "Invalid Username or Password ");
        response.sendRedirect("index.jsp");
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
