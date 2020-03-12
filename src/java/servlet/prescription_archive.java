package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "prescription_archive", urlPatterns = {"/prescription_archive"})
public class prescription_archive extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
            {
                HttpSession session = request.getSession();  
                Connection con = Connector.ConnectDb();
                
                
                Date currentdate = new Date();

                DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
                String cdate =DFormat.format(currentdate);

                DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
                String ct = DFormatlog.format(currentdate);

                String prescript_id = request.getParameter("presc_id");
                String username = session.getAttribute("uname").toString();
                String password = request.getParameter("password");
                
                if (session.getAttribute("acct_Type").equals("personnel"))
                {
                    try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update prescription set archive = 'yes' where id ='"+request.getParameter("presc_id")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Edit Prescription','Archived Presccription','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Prescription Succesfully Archived!");
                            response.sendRedirect("personnel_view_prescriptions.jsp");
                        } 
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                            response.sendRedirect("personnel_view_prescriptions.jsp");
                        }
                       
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("personnel_view_prescriptions.jsp");
                    }
                    /*try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update prescription set archive = 'yes' where id ='"+request.getParameter("presc_id")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"','Edit Prescription','Archived Presccription','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Prescription Succesfully Archived!"+prescript_id);
                            response.sendRedirect("personnel_view_prescriptions.jsp");
                        } 
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                            response.sendRedirect("personnel_view_prescriptions.jsp");
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("personnel_view_prescriptions.jsp");
                    }*/
                }
                
                else if (session.getAttribute("acct_Type").equals("admin"))
                {
                    try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update prescription set archive = 'yes' where id ='"+request.getParameter("presc_id")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Edit Prescription','Archived Presccription','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Prescription Succesfully Archived!");
                            response.sendRedirect("admin_view_prescriptions.jsp");
                        } 
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                            response.sendRedirect("admin_view_prescriptions.jsp");
                        }
                       
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("admin_view_prescriptions.jsp");
                    }
                    /*try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update prescription set archive = 'yes' where id ='"+request.getParameter("presc_id")+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Edit Prescription','Archived Presccription','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 Prescription Succesfully Archived!"+ request.getParameter("presc_id"));
                            response.sendRedirect("admin_view_prescriptions.jsp");
                        } 
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                            response.sendRedirect("admin_view_prescriptions.jsp");
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect("admin_view_prescriptions.jsp");
                    }*/
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
