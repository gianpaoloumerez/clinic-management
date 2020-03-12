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


@WebServlet(name = "admin_add_department", urlPatterns = {"/admin_add_department"})
public class admin_add_department extends HttpServlet 
    {
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
                String Chk = "clear";
                String add_department = request.getParameter("department_name");
                String username = session.getAttribute("uname").toString();
                String password = request.getParameter("password");
                
                try
                {
                    Statement stConfirm = con.createStatement();
                    ResultSet rsConfirm;
                    rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            Statement stChk = con.createStatement();
                            ResultSet rsChk;
                            rsChk = stChk.executeQuery("select * from department");
                            while (rsChk.next())
                            {
                                if (rsChk.getString("department").equals(add_department))
                                {
                                    Chk = "error";
                                }
                            }
                            
                            if (Chk.equals("clear"))
                            {
                                String stAdd = "insert into department (department) values ('"+add_department+"')";
                                PreparedStatement prpAdd = con.prepareStatement(stAdd);
                                prpAdd.execute();

                                String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"','Edit Departments','Added "+add_department+" Department','"+ct+"')";
                                PreparedStatement prpLog = con.prepareStatement(sqlLog);
                                prpLog.execute();
                                
                                session.setAttribute("edit_message", "&#128712 "+add_department+"Department Successfully Added");
                                response.sendRedirect("admin_edit_departments.jsp");
                            }
                            else if (Chk.equals("error"))
                            {
                                session.setAttribute("edit_message", "&#128712 Department Already in the Database");
                                response.sendRedirect("admin_edit_departments.jsp");
                            }
                        
                        }
                        else
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again");
                            response.sendRedirect("admin_edit_departments.jsp");
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
