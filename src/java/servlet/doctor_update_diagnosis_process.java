package servlet;

import java.util.Objects;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import java.sql.*;
import servlet.Connector;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "doctor_update_diagnosis_process", urlPatterns = {"/doctor_update_diagnosis_process"})
public class doctor_update_diagnosis_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
                {
                    HttpSession session = request.getSession();  
                    Connection con = Connector.ConnectDb();
                    String final_diag = request.getParameter("final_diagnosis");
                    String initial_diag = request.getParameter("initial_diagnosis");

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
                        String stAdd = "update appointment set dRemarks = ? where count ='"+ session.getAttribute("appointment_id")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);


                        rsConfirm = stConfirm.executeQuery("select * from doctor where username='"+username+"' and password='"+password+"'");
                        if (rsConfirm.next()) 
                        {
                                prpAdd.setString(1,initial_diag);
                                prpAdd.execute();

                                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('doctor', '"+username+"','"+cdate+"','Edited Appointment','Updated Diagnosis for Appointment No. "+session.getAttribute("appointment_id")+"','"+ct+"')";
                                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                                prpLog.execute();

                                session.setAttribute("edit_message", "&#128712 Diagnosis Successfully Updated");
                                response.sendRedirect("doctor_view_appointment.jsp");

                        }
                        else
                        {
                            session.setAttribute("edit_message_error", "&#128712 Incorrect Password Please Try Again");
                            response.sendRedirect("doctor_view_appointment.jsp");
                        }
                    }
                    catch (Exception e)
                    {

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
