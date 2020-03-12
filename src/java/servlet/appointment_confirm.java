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

/**
 *
 * @author admin
 */
@WebServlet(name = "appointment_confirm", urlPatterns = {"/appointment_confirm"})
public class appointment_confirm extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
            {
                HttpSession session = request.getSession();  
                Connection con = Connector.ConnectDb();

                String username = session.getAttribute("uname").toString();
                String password = request.getParameter("password");
                
                    String patient_id = session.getAttribute("appt_patient_id").toString();
                    String doctor_id = session.getAttribute("appt_doctor_id").toString();
                    String patient_name = session.getAttribute("patient_name").toString();
                    String doctor_name = session.getAttribute("doctor_name").toString();
                    String initial_diag = request.getParameter("initial_diagnosis");
                    String height = request.getParameter("height");
                    String weight = request.getParameter("weight");
                    Integer bp_1 = Integer.parseInt(request.getParameter("bp1"));
                    Integer bp_2 = Integer.parseInt(request.getParameter("bp2"));
                    String status = "Pending";

                    Date currentdate = new Date();

                    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String cdate =DFormat.format(currentdate);

                    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
                    String ct = DFormatlog.format(currentdate);

                    try
                    {   
                    Statement stConfirm = con.createStatement();
                    ResultSet rsConfirm;
                    String stAdd = "insert into appointment (date, dNum, dName, pName, pNum, status, rRemarks, dRemarks, height, weight, bp1, bp2) values (?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement prpAdd = con.prepareStatement(stAdd);

                    rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                    if (rsConfirm.next()) 
                    {
                        prpAdd.setString(1,cdate);
                        prpAdd.setString(2,doctor_id);
                        prpAdd.setString(3,doctor_name);
                        prpAdd.setString(4,patient_name);
                        prpAdd.setString(5,patient_id);
                        prpAdd.setString(6,status);
                        prpAdd.setString(7,initial_diag);
                        prpAdd.setString(8," ");
                        prpAdd.setString(9,height);
                        prpAdd.setString(10,weight);
                        prpAdd.setInt(11,bp_1);
                        prpAdd.setInt(12,bp_2);
                        prpAdd.execute();

                        String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Set Appointment','Set Appointment for "+patient_name+"','"+ct+"')";
                        PreparedStatement prpLog = con.prepareStatement(sqlLog);
                        prpLog.execute();

                        session.setAttribute("appt_patient_id","");
                        session.setAttribute("patient_name","");
                        session.setAttribute("patient_bd","");
                        session.setAttribute("patient_age","");
                        session.setAttribute("patient_sex","");
                        session.setAttribute("patient_height","");
                        session.setAttribute("patient_weight","");
                        session.setAttribute("patient_bp1","");
                        session.setAttribute("patient_bp2","");
                        session.setAttribute("patient_addr","");
                        session.setAttribute("patient_tp","");
                        session.setAttribute("patient_mobile","");
                        session.setAttribute("patient_du","");

                        session.setAttribute("appt_doctor_id","");
                        session.setAttribute("doctor_name","");
                        session.setAttribute("doctor_age","");
                        session.setAttribute("doctor_sex","");
                        session.setAttribute("doctor_dept","");
                        session.setAttribute("doctor_tp","");
                        session.setAttribute("doctor_mobile","");
                        session.setAttribute("appointment_success", "&#128712 Appointment Successfully Set");
                        response.sendRedirect("personnel_dashboard.jsp");
                    } 
                    else
                    {
                        session.setAttribute("appointment_message_date", "&#128712 Incorrect password please Try Again");
                        response.sendRedirect("personnel_select_date.jsp");
                    }
                    }
                    catch (SQLException e)
                    {
                        session.setAttribute("appointment_message_date", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("personnel_select_date.jsp");
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
