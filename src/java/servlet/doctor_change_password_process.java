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

@WebServlet(name = "doctor_change_password_process", urlPatterns = {"/doctor_change_password_process"})
public class doctor_change_password_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
            {
                HttpSession session = request.getSession();  
                Connection con = Connector.ConnectDb();
                
                String old_password = request.getParameter("c_password");
                String new_password = request.getParameter("n_password");

                Date currentdate = new Date();

                DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                String cdate =DFormat.format(currentdate);

                DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
                String ct = DFormatlog.format(currentdate);

                String username = session.getAttribute("uname").toString();
                String password = request.getParameter("password");
  
                try
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update doctor set password = ? where count ='"+ session.getAttribute("doctorID")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        rsConfirm = stConfirm.executeQuery("select * from doctor where username='"+username+"' and password='"+password+"'");
                        if (rsConfirm.next()) 
                        {
                            if (old_password.equals(password))
                            {
                                prpAdd.setString(1,new_password);
                                prpAdd.execute();

                                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('doctor', '"+username+"','"+cdate+"','Update Details','Changed Password','"+ct+"')";
                                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                                prpLog.execute();

                                session.setAttribute("edit_message", "&#128712 Password Successfully Changed!");
                                response.sendRedirect("doctor_change_password.jsp");
                            }
                            else
                            {
                                session.setAttribute("edit_message", "&#128712 Incorrect Current Password!");
                                response.sendRedirect("doctor_change_password.jsp");
                            }

                        }
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again");
                            response.sendRedirect("doctor_change_password.jsp");
                        }
                    }
                catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("doctor_change_password.jsp");
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
