package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Objects;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import java.sql.*;
import javax.servlet.http.HttpSession;
import servlet.Connector;

@WebServlet(name = "admin_change_username_process", urlPatterns = {"/admin_change_username_process"})
public class admin_change_username_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
            {
                HttpSession session = request.getSession();  
                Connection con = Connector.ConnectDb();
                
                String old_username = request.getParameter("c_username");
    String new_username = request.getParameter("n_username");
    
    Date currentdate = new Date();
    
    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
    String cdate =DFormat.format(currentdate);
    
    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
    String ct = DFormatlog.format(currentdate);
    
    String username = session.getAttribute("uname").toString();
    String password = request.getParameter("password");
  
                
            if (old_username.equals(username))
            {
                try
                {  
                    Statement stConfirm = con.createStatement();
                ResultSet rsConfirm;
                String stAdd = "update admin set username = ? ";
                PreparedStatement prpAdd = con.prepareStatement(stAdd);
                
                rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                if (rsConfirm.next()) 
                {
                    prpAdd.setString(1,new_username);
                    prpAdd.execute();

                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Update Details','Change Username from "+old_username+" to "+new_username+"','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();

                    session.setAttribute("edit_message", "&#128712 Username Successfully Changed!");
                    session.setAttribute("uname",new_username);
                    response.sendRedirect("admin_change_username.jsp");
                } 
                else
                {
                    session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                    response.sendRedirect("admin_change_username.jsp");
                }
                }
                catch (Exception e)
                        {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Contact Admin "+e);
                        response.sendRedirect("admin_change_username.jsp");
                        }
            }
            else
            {
                    session.setAttribute("edit_message", "&#128712 Incorrect Current Username!");
                    response.sendRedirect("admin_change_username.jsp");
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
