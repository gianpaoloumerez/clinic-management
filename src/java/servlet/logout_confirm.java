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
import java.sql.Connection;

@WebServlet(name = "logout_confirm", urlPatterns = {"/logout_confirm"})
public class logout_confirm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
            {
                HttpSession session = request.getSession();  
                Date currentdate = new Date();
                DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                String cdate =DFormat.format(currentdate);
                DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
                String ct = DFormatlog.format(currentdate);
                Connection con = Connector.ConnectDb();
                
                try
                {
                if (session.getAttribute("acct_Type").equals("admin"))
                {
                try
                {
                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+session.getAttribute("uname")+"','"+cdate+"','Log Out','Admin Log Out','"+ct+"')";
                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                prpLog.execute();
                session.invalidate();
                response.sendRedirect("index.jsp");
                }
                catch (Exception e)
                {
                    response.sendRedirect("index.jsp");
                }
                }
                else if (session.getAttribute("acct_Type").equals("doctor"))
                {
                try
                {
                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('doctor', '"+session.getAttribute("uname")+"','"+cdate+"','Log Out','Doctor Log Out','"+ct+"')";
                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                prpLog.execute();
                session.invalidate();
                response.sendRedirect("index.jsp");
                }
                catch (Exception e)
                {
                    response.sendRedirect("index.jsp");
                }
                }
                else if (session.getAttribute("acct_Type").equals("personnel"))
                {
                try
                {
                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+session.getAttribute("uname")+"','"+cdate+"','Log Out','Personnel Log Out','"+ct+"')";
                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                prpLog.execute();
                session.invalidate();
                response.sendRedirect("index.jsp");
                }
                catch (Exception e)
                {
                    response.sendRedirect("index.jsp");
                }
                }
                }
                catch (Exception e)
                {
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
