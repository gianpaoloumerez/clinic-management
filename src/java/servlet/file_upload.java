package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//@WebServlet("/file_upload")
@MultipartConfig(maxFileSize = 16177215)

public class file_upload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();  
        String patient_id = session.getAttribute("patient_id").toString();
        String doctor_id = session.getAttribute("doctor_id").toString();
        String patient_name = session.getAttribute("patient_name").toString();
        
        String username = session.getAttribute("uname").toString();
        String password = request.getParameter("password");
        
        InputStream inputStream = null; 
         
        Part filePart = request.getPart("prescription");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        
        Connection conn = null; // connection to the database
        String message = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinic_mngmt", "root", "P@ssw0rd");
            
            Date currentdate = new Date();
            DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
            String cdate =DFormat.format(currentdate);

            DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
            String ct = DFormatlog.format(currentdate);
    
                Statement stConfirm = conn.createStatement();
                ResultSet rsConfirm;
                String stAdd = "insert into prescription (date, patient_num, doctor_num, file_name, remarks, image) values (?,?,?,?,?,?)";
                PreparedStatement prpAdd = conn.prepareStatement(stAdd);

                rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + "personnel" + "' and password='" + password + "'");
                if (rsConfirm.next()) 
                {
                    prpAdd.setString(1,cdate);
                    prpAdd.setString(2,patient_id);
                    prpAdd.setString(3,doctor_id);
                    prpAdd.setString(4,cdate+" "+patient_name);
                    //prpAdd.setString(4,filePart.toString());
                    prpAdd.setString(5," ");
                    prpAdd.setBlob(6,inputStream);
                    prpAdd.execute();

                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Upload Prescription','Uploaded Prescription for "+patient_name+"','"+ct+"')";
                    PreparedStatement prpLog = conn.prepareStatement(sqlLog);
                    prpLog.execute();
                    
                    session.setAttribute("edit_message", "&#128712 Prescription Uploaded Successfuly ");
                    response.sendRedirect("personnel_view_appointment.jsp");
                }
                else
                {
                session.setAttribute("edit_message_error", "&#128712 Incorrect Password");
                response.sendRedirect("personnel_view_appointment.jsp");
                }
            
        }
        catch (Exception ex)
        {
                session.setAttribute("edit_message_error", "&#128712 An Error Has Occured Please Contact Admin "+ex);
                response.sendRedirect("personnel_view_appointment.jsp");
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
