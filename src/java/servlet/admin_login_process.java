/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "admin_login_process", urlPatterns = {"/admin_login_process"})
public class admin_login_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();  
        
        Date currentdate = new Date();
        DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
        String cdate =DFormat.format(currentdate);
        DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
        String ct = DFormatlog.format(currentdate);
        
        String userid = request.getParameter("username");    
        String pwd = request.getParameter("password");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinic_mngmt", "root", "P@ssw0rd");
            Statement st = con.createStatement();
            ResultSet rs;

            rs = st.executeQuery("select * from admin where username='" + userid + "' and password='" + pwd + "'");
            if (rs.next()) 
            {
                session.setAttribute("acct_Type", "admin");
                session.setAttribute("uname", userid);
                session.setAttribute("deptName", " ");
                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+userid+"','"+cdate+"','Log In','Admin Log In','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();

                
                response.sendRedirect("admin_dashboard.jsp");
            } 
            else
            {
                session.setAttribute("login_error", "Incorrect Username or Password");
                response.sendRedirect("admin_login.jsp");
            }
        }
        catch (Exception e)
        {
            session.setAttribute("login_error", "An Error Occured Please Contact Admin");
            response.sendRedirect("admin_login.jsp");
                
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
