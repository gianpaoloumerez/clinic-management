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

@WebServlet(name = "add_doctor_process", urlPatterns = {"/add_doctor_process"})
public class add_doctor_process extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
        {
            HttpSession session = request.getSession();  
            Connection con = Connector.ConnectDb();
            
            String name = request.getParameter("name");
            String telephone = request.getParameter("tel");
            String mobile = request.getParameter("mobile");
            String sex = request.getParameter("sex");
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            String department = request.getParameter("department");
            String email = request.getParameter("email");
            String doctor_username = request.getParameter("doctor_username");
            String doctor_password = request.getParameter("doctor_password");
    
    Date currentdate = new Date();
    
        
    
    DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
    String cdate =DFormat.format(currentdate);
    
    //String bdate = DFormat.format(request.getParameter("bdate"));
    String bdate = request.getParameter("bdate");
    
    DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
    String ct = DFormatlog.format(currentdate);
    
    String username = session.getAttribute("uname").toString();
    String password = request.getParameter("password");
    
            String birthdate = request.getParameter("bdate").toString();
            String chk ="clear";
                    
            String by = birthdate.substring(0,4);
            String bm = birthdate.substring(5,7);
            String bd = birthdate.substring(8,10);

            Integer age = 0;


            DateFormat year = new SimpleDateFormat("yyyy");
            DateFormat month = new SimpleDateFormat("MM");
            DateFormat date = new SimpleDateFormat("dd");

            Integer byear = Integer.parseInt(by);
            Integer bmonth = Integer.parseInt(bm);
            Integer bday = Integer.parseInt(bd);

            Integer cyear = Integer.parseInt(year.format(currentdate));
            Integer cmonth = Integer.parseInt(month.format(currentdate));
            Integer cday = Integer.parseInt(date.format(currentdate));

            if (byear > cyear)
            {   
                age = -1;
            }
            else if (byear.equals(cyear) && bmonth > cmonth)
            {
                age = -1;
            }
            else if (byear.equals(cyear) && bmonth.equals(cmonth) && bday>cday)
            {
                age = -1;
            }
            else if (byear < cyear && bmonth < cmonth)
            {
                age = (cyear - byear);
            }
            else if (byear < cyear && bmonth > cmonth)
            {
                age = (cyear - byear)-1;
            }
            else if (byear < cyear && bmonth == cmonth && bday > cday)
            {
                age = (cyear - byear)-1;
            }
            else if (byear < cyear && bmonth.equals(cmonth) && bday < cday)
            {
                age = (cyear - byear);
            }
            else if (byear < cyear && bmonth == cmonth && bday.equals(cday))
            {
                age = (cyear - byear);
            }
            else if ( byear.equals(year) && bmonth < cmonth)
            {
                age = 0;
            }
            else if (byear.equals(cyear) && bmonth.equals(cmonth) && bday < cday)
            {
                age = 0;
            }

            if (age > -1)
            {
                try 
                {
                    PreparedStatement prpCHKDOC = con.prepareStatement("select username from doctor");
                    ResultSet rsdoccheck = prpCHKDOC.executeQuery();
                    while (rsdoccheck.next())
                        {
                            if (doctor_username.equals(rsdoccheck.getString("username")))
                            {
                                chk = "error";
                            }
                        } 
                }
                catch (Exception e)
                {
                    session.setAttribute("successful", "&#128712 An Error Occured Please Contact Admin ");
                    response.sendRedirect("admin_add_doctor.jsp");
                }
               
                
                if ( chk.equals("clear"))
                {
                try
                {
                Statement stConfirm = con.createStatement();
                ResultSet rsConfirm;
                String stAdd = "insert into doctor (name, gender, address, phone, tphone, status, email,  birthday, username,password, dept, date, date_updated) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement prpAdd = con.prepareStatement(stAdd);

                rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                if (rsConfirm.next()) 
                {
                    prpAdd.setString(1,name);
                    prpAdd.setString(2,sex);
                    prpAdd.setString(3,address);
                    prpAdd.setString(4,mobile);
                    prpAdd.setString(5,telephone);
                    prpAdd.setString(6,status);
                    prpAdd.setString(7,email);
                    prpAdd.setString(8,bdate);
                    prpAdd.setString(9,doctor_username);
                    prpAdd.setString(10,doctor_password);
                    prpAdd.setString(11,department);
                    prpAdd.setString(12,cdate);
                    prpAdd.setString(13,cdate);
                    prpAdd.execute();

                    String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Add Doctor','Registered Doctor "+name+"','"+ct+"')";
                    PreparedStatement prpLog = con.prepareStatement(sqlLog);
                    prpLog.execute();

                    session.setAttribute("successful", "&#128712 Doctor Successfully Registered!");
                    response.sendRedirect("admin_add_doctor.jsp");
                } 
                else
                {
                    session.setAttribute("successful", "&#128712 Incorrect password please Try Again");
                    response.sendRedirect("admin_add_doctor.jsp");
                }
                }
                catch (Exception e)
                {
                    session.setAttribute("successful", "&#128712 An Error Occured Please Contact Admin"+e);
                    response.sendRedirect("admin_add_doctor.jsp");
                }
            }
                else if (chk.equals("error"))
                {
                    session.setAttribute("successful", "&#128712 Username Already Taken Please Try Again");
                    response.sendRedirect("admin_add_doctor.jsp"); 
                }
            }
            else 
            {
               session.setAttribute("successful", "&#128712 Invalid Birthdate Please Try Again");
               response.sendRedirect("admin_add_doctor.jsp"); 
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
