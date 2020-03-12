package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import javax.servlet.http.HttpSession;

@WebServlet(name = "remove_item", urlPatterns = {"/remove_item"})
public class remove_item extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            HttpSession session = request.getSession();  
            Connection con = Connector.ConnectDb();
            
            Date currentdate = new Date();
            DateFormat DFormat = new SimpleDateFormat("yyyy-MM-dd");
            String cdate =DFormat.format(currentdate);
            DateFormat DTFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
            String cdate_time =DTFormat.format(currentdate);
            DateFormat DFormatlog = new SimpleDateFormat("hh:mm a");
            String ct = DFormatlog.format(currentdate);
            String item_id = request.getParameter("inventory_id");
            String item_name = request.getParameter("item_name");
            String username = session.getAttribute("uname").toString();
            String password = request.getParameter("password");
            String archive = " ";
            String return_address = session.getAttribute("return_address").toString();
            String message = " ";
            String log = " ";
            
            if (session.getAttribute("acct_Type").equals("personnel"))
            {
                try
                {
                    Statement stCheckArchived = con.createStatement();
                    ResultSet rsCheckArchived;
                    
                    rsCheckArchived = stCheckArchived.executeQuery("select * from inventory where id = '"+item_id+"'");
                    if (rsCheckArchived.next())
                    {
                        if (rsCheckArchived.getString("archive").equals("no"))
                        {
                            archive = "yes";
                            message = "&#128712 Item "+item_name+" Successfully Archived";
                            log = "'Removed Item in Inventory','Removed Item "+item_name+"','";
                        }
                        else if (rsCheckArchived.getString("archive").equals("yes"))
                        {
                            archive = "no";
                            message = "&#128712 Item "+item_name+" Successfully Restored";
                            log = "'Restored Item in Inventory','restored Item "+item_name+"','";
                        } 
                    }
                        
                }
                catch (Exception e)
                {
                    session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                    response.sendRedirect(return_address);
                }
                
                 try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update inventory set archive = '"+archive+"' where id = '"+item_id+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);

                        rsConfirm = stConfirm.executeQuery("select * from receptionist where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('personnel', '"+username+"','"+cdate+"',"+log+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", message);
                            response.sendRedirect(return_address);
                        }
                        else 
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again ");
                            response.sendRedirect(return_address);
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect(return_address);
                    }
            }
            
            else if (session.getAttribute("acct_Type").equals("admin"))
            {
                
                    try
                        {
                            Statement stCheckArchived = con.createStatement();
                            ResultSet rsCheckArchived;

                            rsCheckArchived = stCheckArchived.executeQuery("select * from inventory where id = '"+item_id+"'");
                            if (rsCheckArchived.next())
                            {
                                if (rsCheckArchived.getString("archive").equals("no"))
                                {
                                    archive = "yes";
                                    message = "&#128712 Item "+item_name+" Successfully Archived";
                                    log = "'Removed Item in Inventory','Removed Item "+item_name+"','";
                                }
                                else if (rsCheckArchived.getString("archive").equals("yes"))
                                {
                                    archive = "no";
                                    message = "&#128712 Item "+item_name+" Successfully Restored";
                                    log = "'Restored Item in Inventory','restored Item "+item_name+"','";
                                } 
                            }

                        }
                        catch (Exception e)
                        {
                            session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                            response.sendRedirect(return_address);
                        }
                
                    try 
                    {
                        Statement stConfirm = con.createStatement();
                        ResultSet rsConfirm;
                        String stAdd = "update inventory set archive = '"+archive+"' where id = '"+item_id+"'";
                        PreparedStatement prpAdd = con.prepareStatement(stAdd);

                        rsConfirm = stConfirm.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
                        if (rsConfirm.next()) 
                        {
                            prpAdd.execute();

                            String sqlLog = "insert into log(acct_type, username, date, change_type, description,time) values ('admin', '"+username+"','"+cdate+"',"+log+ct+"')";
                            PreparedStatement prpLog = con.prepareStatement(sqlLog);
                            prpLog.execute();

                            session.setAttribute("edit_message", message);
                            response.sendRedirect(return_address);
                        }
                        else 
                        {
                            session.setAttribute("edit_message", "&#128712 Incorrect Password Please Try Again ");
                            response.sendRedirect(return_address);
                        }
                    }
                    catch (Exception e)
                    {
                        session.setAttribute("edit_message", "&#128712 An Error Occured Please Contact Admin "+e);
                        response.sendRedirect(return_address);
                    }
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
