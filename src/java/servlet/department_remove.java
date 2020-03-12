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

@WebServlet(name = "department_remove", urlPatterns = {"/department_remove"})
public class department_remove extends HttpServlet {

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
                
                Integer num_doc = 0;
                String deptID = request.getParameter("dept_id");
                String deptName = request.getParameter("dept_name");
                String chk = "clear";
                String username = session.getAttribute("uname").toString();
                String password = request.getParameter("password");
                try 
                {
                        PreparedStatement prpCHK = con.prepareStatement("select * from doctor");
                        ResultSet rscheck = prpCHK.executeQuery();
                        while (rscheck.next())
                            {
                                if (deptName.equals(rscheck.getString("dept")))
                                {
                                    num_doc++;
                                    chk = "error";
                                }
                            }
                    
                        
                    if (chk.equals("error"))
                    {
                        session.setAttribute("edit_message", "&#128712 Cannot Remove Department "+num_doc+" Doctors still Tagged");
                        session.setAttribute("deptName",deptName);
                        response.sendRedirect("admin_edit_departments.jsp");
                    }
                    else if (chk.equals("clear"))
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                        String stAdd = "delete from department where id ='"+deptID+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);
                        
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Edit Departments','Removed "+deptName+" Department','"+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", "&#128712 "+deptName+" Department Successfully Removed");
                            response.sendRedirect("admin_edit_departments.jsp");
                         } 
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect password please Try Again");
                            response.sendRedirect("admin_edit_departments.jsp");
                        }   
                        
                    }
                }
                catch (Exception e)
                {
                    session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                    response.sendRedirect("admin_edit_departments.jsp");
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
