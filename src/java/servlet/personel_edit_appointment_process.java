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

@WebServlet(name = "personel_edit_appointment_process", urlPatterns = {"/personel_edit_appointment_process"})
public class personel_edit_appointment_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
                {
                    HttpSession session = request.getSession();  
                    Connection con = Connector.ConnectDb();
                    
                    String username = session.getAttribute("uname").toString();
                    String password = request.getParameter("password");

                    String initial_diag = request.getParameter("initial_diagnosis");
                    String status = request.getParameter("appt_status");
                    String weight = request.getParameter("weight");
                    String height = request.getParameter("height");
                    Integer bp1 = Integer.parseInt(request.getParameter("bp1"));
                    Integer bp2 = Integer.parseInt(request.getParameter("bp2"));
                    Date currentdate = new Date();

                    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String cdate =DFormat.format(currentdate);

                    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
                    String ct = DFormatlog.format(currentdate);

                    DateFormat year = new SimpleDateFormat("yyyy");
                    DateFormat month = new SimpleDateFormat("MM");
                    DateFormat date = new SimpleDateFormat("dd");

                    try
                    {
                    Statement stConfirm = con.createStatement();
                    ResultSet rsConfirm;
                    String stAdd = "update appointment set height = ?, weight = ?, bp1 = ?, bp2 = ?, status = ?, rRemarks = ? where count = '"+session.getAttribute("appointment_id")+"'";
                    PreparedStatement prpAdd = con.prepareStatement(stAdd);

                    rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                    if (rsConfirm.next()) 
                    {
                        prpAdd.setString(1,height);
                        prpAdd.setString(2,weight);
                        prpAdd.setInt(3,bp1);
                        prpAdd.setInt(4,bp2);
                        prpAdd.setString(5,status);
                        prpAdd.setString(6,initial_diag);
                        prpAdd.execute();

                        String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Edit Appointment','Edited Details of Appointment No. "+session.getAttribute("appointment_number")+"','"+ct+"')";
                        PreparedStatement prpLog = con.prepareStatement(sqlLog);
                        prpLog.execute();

                        session.setAttribute("edit_message", "&#128712 Details Successfully Updated");
                        response.sendRedirect("personnel_view_appointment.jsp");
                    } 
                    else
                    {
                        session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                        response.sendRedirect("personnel_edit_appointment.jsp");
                    }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("personnel_edit_appointment.jsp");
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
